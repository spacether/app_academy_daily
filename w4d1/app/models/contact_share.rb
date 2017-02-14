# == Schema Information
#
# Table name: contact_shares
#
#  id         :integer          not null, primary key
#  contact_id :integer          not null
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#


class ContactShare < ActiveRecord::Base
  validates :user_id, :contact_id, presence: true
  validate :unique_combo

  def unique_combo
    exists = ContactShare.find_by_user_id_and_contact_id(@user_id, @contact_id)
    if exists
      self.errors[:user_id] << "and contact_id must be unique"
    end
  end

  belongs_to :contact,  

  belongs_to :sharee,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

end
