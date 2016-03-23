class Place < ActiveRecord::Base
  include JpPrefecture
  jp_prefecture :prefecture_id
  enum place_type: { restaurant: 0, shop: 1, place: 2 }
  has_many :favorites, as: :favoriteable
  has_many :place_article_relays, dependent: :destroy
  has_many :articles, through: :place_article_relays
  has_many :place_item_relays, dependent: :destroy
  has_many :items, through: :place_item_relays
  has_many :place_social_account_relays, dependent: :destroy
  has_many :social_accounts, through: :place_social_account_relays
end
