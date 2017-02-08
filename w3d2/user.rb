require_relative 'shared'

class User < Shared
  attr_reader :id

  def self.find_by_name(fname, lname)
    self.items_by_hash('fname' => fname, 'lname' => lname)
  end

  def initialize(options)
    vars = ['fname', 'lname']
    super(vars, options)
  end

  def authored_questions
    Question.find_by_author_id(@id)
  end

  def authored_replies
    Replie.find_by_user_id(@id)
  end

  def followed_questions
    QuestionFollows.followed_questions_for_user_id(@id)
  end

  def liked_questions
    QuestionLike.liked_questions_for_user_id(@id)
  end

  def average_karma
    query = <<-SQL
    SELECT
      COUNT(question_likes.id) / CAST(COUNT(DISTINCT(questions.id)) AS float) AS karma
    FROM
      questions
    LEFT OUTER JOIN
      question_likes ON questions.id = question_likes.question_id
    WHERE
      questions.author_id = ?
    SQL
    data = QuestionsDatabase.instance.execute(query, @id)
    data.first['karma']
  end
end
