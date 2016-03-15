class ArticlePictureRelay < ActiveRecord::Base
  belongs_to :picture, foreign_key: :picture_id
  belongs_to :article, foreign_key: :article_id
end
