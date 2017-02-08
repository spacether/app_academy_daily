require_relative 'questions_database'
require_relative 'shared'

class QuestionLike < Shared
  attr_reader :id

  def self.most_liked_questions(n)
    query = <<-SQL
    SELECT
      questions.id, title, body, author_id
    FROM
      questions
    JOIN
      question_likes ON questions.id = question_likes.question_id
    GROUP BY
      questions.id
    ORDER BY COUNT(*) DESC
    LIMIT ?
    SQL
    data = QuestionsDatabase.instance.execute(query, n)
    data.map { |datum| Question.new(datum) }
  end

  def self.likers_for_question_id(id)
    query = <<-SQL
    SELECT
      users.id, users.fname, users.lname
    FROM
      users
    JOIN
      question_likes ON users.id = question_likes.user_id
    WHERE
      question_id = ?
    SQL
    data = QuestionsDatabase.instance.execute(query, id)
    data.map { |datum| User.new(datum) }
  end

  def self.num_likes_for_question_id(id)
    query = <<-SQL
    SELECT
      COUNT(*) AS count
    FROM
      users
    JOIN
      question_likes ON users.id = question_likes.user_id
    WHERE
      question_id = ?
    SQL
    data = QuestionsDatabase.instance.execute(query, id)
    data.first['count']
  end

  def self.liked_questions_for_user_id(id)
    query = <<-SQL
    SELECT
      questions.id, title, body, author_id
    FROM
      questions
    JOIN
      question_likes ON questions.id = question_likes.question_id
    WHERE
      question_likes.user_id = ?
    SQL
    data = QuestionsDatabase.instance.execute(query, id)
    data.map { |datum| Question.new(datum) }
  end

  def initialize(options)
    vars = ['user_id', 'question_id']
    super(vars, options)
  end
end
