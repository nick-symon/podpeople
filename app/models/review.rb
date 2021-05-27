class Review < ApplicationRecord
  belongs_to :podcast
  belongs_to :user
  validates_associated :podcast, :user 
  validates :podcast, :user, :rating, presence: true
  validates :rating, inclusion: {in: 1..5 }
end
