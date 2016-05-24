class Area < ActiveRecord::Base
  include GeoModule
  after_create :generate_geohash

  def places_belong_to_this_area_filterd
    neighbors = GeoHash.neighbors(self.geohash).unshift(self.geohash)
    return Place.where(geohash: detect_neighbors_indexes(neighbors))
  end

  # 強制的に周辺エリア全域のお店を抽出したい場合にはこちらを利用
  def places_belong_to_this_area
    neighbors = GeoHash.neighbors(self.geohash).unshift(self.geohash)
    return Place.where(geohash: neighbors)
  end

  def detect_neighbors_indexes(neighbors)
    # GeoHash.neighborsを利用した時に引数に与えるgeohash（以下図だと0の箇所）
    # を基点にして以下のように周囲の値が算出される
    # それぞれのエリアのindex値とマッチするものだけ抽出する
    #
    # +---+---+---+
    # | 8 | 1 | 2 |
    # +---+---+---+
    # | 7 | 0 | 3 |
    # +---+---+---+
    # | 6 | 5 | 4 |
    # +---+---+---+
    result = []
    indexes = [
      self.north_direction,
      self.northeast_direction,
      self.east_direction,
      self.southeast_direction,
      self.south_direction,
      self.southwest_direction,
      self.west_direction,
      self.northwest_direction
    ]
    neighbors.each_with_index do |val, index|
      result.push(val) if indexes[index]
    end
    result
  end
end
