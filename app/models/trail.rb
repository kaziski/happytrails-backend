class Trail < ApplicationRecord
  has_many :reviews
  belongs_to :user

  validates_presence_of :name, :message => "Can't be blank"
  validates_presence_of :length
end
