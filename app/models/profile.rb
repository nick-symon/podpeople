class Profile < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  validates :username, presence: true
end
