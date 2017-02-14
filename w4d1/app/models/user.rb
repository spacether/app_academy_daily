# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  username   :string           not null
#

class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true

  has_many :contacts, dependent: :delete_all

  has_many :contact_shares, dependent: :delete_all

  has_many :shared_contacts,
    through: :contact_shares,
    source: :contact
end
