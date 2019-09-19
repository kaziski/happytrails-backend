class Trail < ApplicationRecord
  has_many :users
  has_many :reviews
end
