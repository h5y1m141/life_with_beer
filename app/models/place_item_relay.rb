class PlaceItemRelay < ActiveRecord::Base
  belongs_to :place, foreign_key: :place_id
  belongs_to :item, foreign_key: :item_id
end
