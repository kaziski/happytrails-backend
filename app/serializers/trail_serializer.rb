class TrailSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :length, :url, :longitude, :latitude
end
