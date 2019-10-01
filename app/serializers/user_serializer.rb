class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :id
  has_many :reviews, serializer: ReviewSerializer
  has_many :trails, serializer: TrailSerializer
end
