class Guide < ApplicationRecord
  has_many :ratings
  has_many :users, through: :ratings
  belongs_to :user
  belongs_to :destination, optional: true

  validates :title, presence: true
  validates :summary, presence: true
  
  scope :ordered_by_ratings, -> { joins(:ratings)}
end
