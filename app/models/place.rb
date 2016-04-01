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
  
  accepts_nested_attributes_for :social_accounts
  def self.place_type_list
    result = []
    self.place_types.keys.each_with_index do|account, index|
      result.push([account, index])
    end
    result
  end

  def self.prefectures
    JpPrefecture::Prefecture.all.map{|o| [o.name, o.code]}
  end
end
