class Guide < ApplicationRecord
  has_many :ratings
  has_many :users, through: :ratings
  belongs_to :destination

  scope :ordered_by_ratings, -> { joins(:ratings)}
end
