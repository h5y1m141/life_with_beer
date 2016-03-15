class Tag < ActiveRecord::Base
  # include TagSearchModule
  has_many :item_tag_relays, dependent: :destroy
  has_many :items, through: :item_tag_relays
end
