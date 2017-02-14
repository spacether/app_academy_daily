# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  email      :string           not null
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Contact < ActiveRecord::Base
  validates :user_id, :email, :name, presence: true
  validate :unique_combo

  def unique_combo
    exists = Contact.find_by_user_id_and_email(self.user_id, self.email)
    if exists
      self.errors[:user_id] << "and email must be unique"
    end
  end

  belongs_to :owner,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :contact_shares

  has_many :sharees,
    through: :contact_shares,
    source: :sharee
end
