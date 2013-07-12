class Earthquake < ActiveRecord::Base
  geocoded_by :address, latitude: :lat, longitude: :lon
end
