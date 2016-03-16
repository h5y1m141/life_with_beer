class SocialAccount < ActiveRecord::Base
  belongs_to :brewery, foreign_key: :brewery_id
  enum account_type: { facebook: 0, twitter: 1, hatena: 2, google_plus: 3, blog: 4, instagram: 5 }
  has_many :brewery_social_account_relays, dependent: :destroy
  has_many :breweries, through: :brewery_social_account_relays
end
