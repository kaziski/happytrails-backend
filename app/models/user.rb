class User < ApplicationRecord
  has_secure_password
  has_many :reviews
  has_many :trails, through: :reviews
  has_many :trails, through: :likes
  validates :username, presence: true, uniqueness: true
end
