class Profile < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :username, presence: true

  def likes_podcast?(podcast_id)
    Like.where(profile_id: id, likeable_id: podcast_id, likeable_type: "Podcast").present?
  end
end
