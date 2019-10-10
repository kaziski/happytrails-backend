class TrailSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :length, :url, :imgSmallMed, :summary, :longitude, :latitude, :api_trail_id
  has_many :reviews
end
