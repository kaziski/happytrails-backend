class ReviewSerializer
  include FastJsonapi::ObjectSerializer
  attributes :comment, :api_trail_id, :api_trail_name, :api_trail_url, :user_id, :api_reviews, :username
  #api_reviews is coming from a helper method in review.rb
  belongs_to :trail, serializer: TrailSerializer
end
