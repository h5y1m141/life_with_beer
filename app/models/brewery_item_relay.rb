class BreweryItemRelay < ActiveRecord::Base
  belongs_to :brewery, foreign_key: :brewery_id
  belongs_to :item, foreign_key: :item_id
end
