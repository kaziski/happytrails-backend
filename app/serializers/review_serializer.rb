class ReviewSerializer
  include FastJsonapi::ObjectSerializer
  attributes :comment, :trail_id, :user_id
  belongs_to :trail, serializer: TrailSerializer
  #belongs_to :user :trail
  # attribute :trail do |review|
  #   {
  #     name: review.trail.name,
  #     length: review.trail.length,
  #     url: review.trail.url,
  #     longitude: review.trail.longitude,
  #     latitude: review.trail.latitude
  #   }
  # end
end
