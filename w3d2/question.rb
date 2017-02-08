require_relative 'questions_database'
#require_relative 'user'
#require_relative 'shared'

class Question < Shared
  attr_reader :id

  def self.most_followed(n)
    QuestionFollows.most_followed_questions(n)
  end

  def self.most_liked(n)
    QuestionLike.most_liked_questions(n)
  end

  def self.find_by_author_id(author_id)
    self.items_by_hash('author_id' => author_id)
  end

  def initialize(options)
    vars = ['title', 'body', 'author_id']
    super(vars, options)
  end

  def author
    User.find_by_id(@author_id)
  end

  def replies
    Replie.find_by_question_id(@id)
  end

  def followers
    QuestionFollows.followers_for_question_id(@id)
  end

  def likers
    QuestionLike.likers_for_question_id(@id)
  end

  def num_likes
    QuestionLike.num_likes_for_question_id(@id)
  end

end
