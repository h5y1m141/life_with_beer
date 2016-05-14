module GeoModule
  extend ActiveSupport::Concern
  included do
    def generate_geohash
      if(self.latitude && self.longitude)
        self.geohash = GeoHash.encode(self.latitude, self.longitude, 6)
        self.save
      end
    end
  end
end
