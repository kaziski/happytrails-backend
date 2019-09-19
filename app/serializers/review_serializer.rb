class ReviewSerializer
  include FastJsonapi::ObjectSerializer
  attributes :comment, :trail_id, :user_id
end
