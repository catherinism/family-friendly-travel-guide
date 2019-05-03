class Guide < ApplicationRecord
  has_many :ratings
  # has_many :users, through: :ratings
  belongs_to :destination
  belongs_to :user

  validates :title, presence: true
  validates :summary, presence: true

  # scope :ordered_by_ratings, -> { joins(:ratings)}
end
