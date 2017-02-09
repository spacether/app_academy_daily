# == Schema Information
#
# Table name: topics
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime
#  updated_at :datetime
#

class Topic < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :tags,
    primary_key: :id,
    foreign_key: :topic_id,
    class_name: :Tag

  has_many :urls,
    -> { distinct },
    through: :tags,
    source: :url

  def popular_links
    links = self.urls.map { |url| [url, url.num_clicks] }
    links.sort_by! { |arr| -arr[1] }
    links.each do |arr|
      p arr
    end
  end
end
