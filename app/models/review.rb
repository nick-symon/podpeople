class Review < ApplicationRecord
  belongs_to :podcast
  belongs_to :profile
  has_many :likes, as: :likeable
  validates_associated :podcast, :profile 
  validates :podcast, :profile, :rating, presence: true
  validates :rating, inclusion: {in: 1..5 }
end
