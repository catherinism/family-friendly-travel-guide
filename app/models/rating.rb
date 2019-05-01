class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :guide

  validates :value, presence: true, inclusion: { in:[-1, 1], message: "can only be 1 or -1" }
end
