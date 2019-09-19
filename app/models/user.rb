class User < ApplicationRecord
  has_many :trails
  has_many :reviews
  has_secure_password
end
