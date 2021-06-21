class Podcast < ApplicationRecord
  self.primary_key = 'id'
  has_many :episodes, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :list_joins, as: :listable, dependent: :destroy
  has_many :lists, through: :list_joins, dependent: :destroy
  validates :rss_feed_link, :title, presence: true
  validates :rss_feed_link, uniqueness: true

  def self.search(query)
    podcasts = Podcast.where("title ILIKE ?", "%#{query}%")
  end

  def avg_rating
    reviews.average("rating")
  end
end
