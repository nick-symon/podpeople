class Profile < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :username, presence: true
end
