require_relative 'questions_database'
require_relative 'shared'

class Replie < Shared
  attr_reader :id

  def self.find_by_question_id(id)
    self.items_by_hash('question_id' => id)
  end

  def self.find_by_user_id(id)
    self.items_by_hash('user_id' => id)
  end

  def initialize(options)
    vars = ['question_id', 'parent_reply_id', 'user_id', 'body']
    super(vars, options)
  end

  def author
    User.find_by_id(@user_id)
  end

  def question
    Question.find_by_id(@question_id)
  end

  def parent_reply
    self.class.find_by_id(@parent_reply_id) unless @parent_reply_id.nil?
  end

  def child_replies
    qid = @question_id
    pid = @id
    query = "SELECT * FROM replies WHERE question_id = ? AND parent_reply_id = ?"
    data = QuestionsDatabase.instance.execute(query, qid, pid)
    data.map { |datum| self.class.new(datum) }
  end
end
