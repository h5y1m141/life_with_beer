class BrewerySocialAccountRelay < ActiveRecord::Base
  belongs_to :brewery, foreign_key: :brewery_id
  belongs_to :social_account, foreign_key: :social_account_id
end
