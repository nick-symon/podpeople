class Episode < ApplicationRecord
  self.primary_key = 'guid'
  belongs_to :podcast
  has_many :list_joins, as: :listable 
  has_many :lists, through: :list_joins
  validates :podcast, presence: true
  validates :guid, uniqueness: true
end
