class Area < ActiveRecord::Base
  include GeoModule
  after_create :generate_geohash
end
