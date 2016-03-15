class CreateArticleItemRelays < ActiveRecord::Migration
  def change
    create_table :article_item_relays do |t|
      t.integer :item_id
      t.integer :article_id

      t.timestamps null: false
    end
  end
end
