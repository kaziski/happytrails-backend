class User < ApplicationRecord
  has_many :reviews
  has_many :trails, through: :reviews

  # has_secure_password
  # validates_presence_of :name
  
end
