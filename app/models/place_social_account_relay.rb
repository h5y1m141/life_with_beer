class PlaceSocialAccountRelay < ActiveRecord::Base
  belongs_to :place, foreign_key: :place_id
  belongs_to :social_account, foreign_key: :social_account_id
end
