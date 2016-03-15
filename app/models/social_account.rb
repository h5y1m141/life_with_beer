class SocialAccount < ActiveRecord::Base
  belongs_to :brewery, foreign_key: :brewery_id
  enum account_type: { facebook: 0, twitter: 1, hatena: 2, google_plus: 3 }
end
