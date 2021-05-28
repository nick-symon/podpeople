class Review < ApplicationRecord
  belongs_to :podcast
  belongs_to :profile
  validates_associated :podcast, :profile 
  validates :podcast, :profile, :rating, presence: true
  validates :rating, inclusion: {in: 1..5 }
end
