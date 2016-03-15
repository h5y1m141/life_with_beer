class PlaceArticleRelay < ActiveRecord::Base
  belongs_to :place, foreign_key: :place_id
  belongs_to :article, foreign_key: :article_id
end
