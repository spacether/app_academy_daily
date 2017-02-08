require_relative 'questions_database'
require_relative 'shared'

class QuestionFollows < Shared
  attr_reader :id

  def self.followed_questions_for_user_id(id)
    query = <<-SQL
    SELECT
      questions.id, title, body, author_id
    FROM
      questions
    JOIN
      question_follows ON questions.id = question_follows.question_id
    WHERE
      user_id = ?
    SQL
    data = QuestionsDatabase.instance.execute(query, id)
    data.map { |datum| Question.new(datum) }
  end

  def self.followers_for_question_id(id)
    query = <<-SQL
    SELECT
      users.id, users.fname, users.lname
    FROM
      users
    JOIN
      question_follows ON users.id = question_follows.user_id
    WHERE
      question_id = ?
    SQL
    data = QuestionsDatabase.instance.execute(query, id)
    data.map { |datum| User.new(datum) }
  end

  def self.most_followed_questions(n)
    query = <<-SQL
    SELECT
      questions.id, title, body, author_id
    FROM
      questions
    JOIN
      question_follows ON questions.id = question_follows.question_id
    GROUP BY questions.id
    ORDER BY COUNT(*) DESC
    LIMIT ?
    SQL
    data = QuestionsDatabase.instance.execute(query, n)
    data.map { |datum| Question.new(datum) }
  end

  def initialize(options)
    vars = ['user_id', 'question_id']
    super(vars, options)
  end
end
