# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  user_id          :integer          not null
#  answer_choice_id :integer          not null
#

class Response < ActiveRecord::Base
  validates :user_id, :answer_choice_id, presence: true
  validate :not_duplicate_response

  def not_duplicate_response
    answers = sibling_responses.where(user_id: self.user_id).count
    if answers > 0
      errors[:user_id] << "This user already ansered this question"
      errors[:answer_choice_id] << "This user already ansered this question"
    end
  end

  def sibling_responses
    self.question.responses
  end

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :AnswerChoice

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_one :question,
    through: :answer_choice,
    source: :question
end
