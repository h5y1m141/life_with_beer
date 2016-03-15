class ItemTagRelay < ActiveRecord::Base
  belongs_to :item, foreign_key: :item_id
  belongs_to :tag, foreign_key: :tag_id
end
