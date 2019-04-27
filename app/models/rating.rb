class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :guide

  validates :value, presence: true
end
