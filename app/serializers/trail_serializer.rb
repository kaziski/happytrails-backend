class TrailSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :length, :url, :longitude, :latitude
  has_many :reviews
end
