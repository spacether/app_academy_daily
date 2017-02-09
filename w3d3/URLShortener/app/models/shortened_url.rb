# == Schema Information
#
# Table name: shortened_urls
#
#  id         :integer          not null, primary key
#  short_url  :string           not null
#  long_url   :string           not null
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#
require 'securerandom'

class ShortenedUrl < ActiveRecord::Base
  validates :short_url, presence: true, uniqueness: true
  validates :long_url, presence: true

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :visits,
    primary_key: :id,
    foreign_key: :short_url_id,
    class_name: :Visit

  has_many :visitors,
    -> { distinct },
    through: :visits,
    source: :user

  has_many :tags,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: :Tag

  has_many :topics,
    -> { distinct },
    through: :tags,
    source: :topic

  def self.make(user, long_url)
    self.create!(short_url: self.random_code, long_url: long_url, user_id: user.id)
  end

  def self.random_code
    vals = self.uniq.pluck(:short_url)
    val = nil
    while true
      val ||= SecureRandom.urlsafe_base64(12)
      break unless vals.include?(val)
    end
    val
  end

  def num_clicks
    self.visits.count
  end

  def num_uniques
    self.visitors.count
  end

  def num_recent_uniques(min_window)
    uniques = self.visits.select(:user_id).distinct
    uniques.where("updated_at >= ?", min_window.minutes.ago).count
  end

end
