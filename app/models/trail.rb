class Trail < ApplicationRecord
  has_many :reviews
  has_many :likes
  has_many :users, through: :reviews
  has_many :users, through: :likes

  validates_presence_of :name, :message => "Can't be blank"
  validates_presence_of :length
end
