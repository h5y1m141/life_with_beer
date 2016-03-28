class Brewery < ActiveRecord::Base
  has_many :brewery_social_account_relays, dependent: :destroy
  has_many :social_accounts, through: :brewery_social_account_relays
  has_many :brewery_item_relays, dependent: :destroy
  has_many :items, through: :brewery_item_relays
  mount_uploader :image, PictureUploader

  accepts_nested_attributes_for :social_accounts
  accepts_nested_attributes_for :items
end
