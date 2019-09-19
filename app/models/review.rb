class Review < ApplicationRecord
  belongs_to :user
  belongs_to :trail

  validates_presence_of :comment
end

