class ReviewSerializer
  include FastJsonapi::ObjectSerializer
  attributes :comment, :api_trail_id, :api_trail_name, :api_trail_url, :user_id
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
