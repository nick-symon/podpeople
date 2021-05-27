class Review < ApplicationRecord
  belongs_to :podcast
  belongs_to :user
  validates_associated :podcast, :user 
  validates :podcast, :user, :rating, presence: true
end
