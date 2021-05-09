class Episode < ApplicationRecord
  self.primary_key = 'guid'
  belongs_to :podcast
  validates :podcast, presence: true
end
