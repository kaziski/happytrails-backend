class Review < ApplicationRecord
  belongs_to :user
  belongs_to :trail, optional: true

  validates_presence_of :comment
end

