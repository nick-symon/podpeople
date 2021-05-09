class Podcast < ApplicationRecord
  self.primary_key = 'id'
  has_many :episodes
  validates :rss_feed_link, :title, presence: true
  validates :rss_feed_link, uniqueness: true
end
