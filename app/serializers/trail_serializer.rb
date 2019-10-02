class TrailSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :length, :url, :imgSmallMed, :summary, :longitude, :latitude
  has_many :reviews
end
