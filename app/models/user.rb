class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :ratings
  has_many :guides, through: :ratings
  has_secure_password

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true

end
