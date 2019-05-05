class Guide < ApplicationRecord
  has_many :ratings
  has_many :users, through: :ratings
  belongs_to :destination
  # belongs_to :user

  validates :title, presence: true
  validates :summary, presence: true

  scope :rated, -> { joins(:ratings).distinct("ratings.guide_id") }


end
