class Like < ApplicationRecord
  belongs_to :profile
  belongs_to :likeable, polymorphic: true
  validates :profile, uniqueness: {scope: :likeable, message: "only one user like per object"}
end
