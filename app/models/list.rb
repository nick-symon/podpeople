class List < ApplicationRecord
  belongs_to :profile
  has_many :list_joins, dependent: :destroy
end
