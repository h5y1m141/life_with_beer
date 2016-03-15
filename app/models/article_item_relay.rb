class ArticleItemRelay < ActiveRecord::Base
  belongs_to :item, foreign_key: :item_id
  belongs_to :article, foreign_key: :article_id
end
