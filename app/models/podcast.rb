class Podcast < ApplicationRecord
  self.primary_key = 'id'
  has_many :episodes
  has_many :reviews
  has_many :likes, as: :likeable 
  has_many :list_joins, as: :listable 
  has_many :lists, through: :list_joins
  validates :rss_feed_link, :title, presence: true
  validates :rss_feed_link, uniqueness: true

  def self.search(query)
    podcasts = Podcast.where("title ILIKE ?", "%#{query}%")
  end
end
