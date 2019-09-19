class Trail < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews

  validates_presence_of :name, :message => "Can't be blank"
  validates_presence_of :length
end
