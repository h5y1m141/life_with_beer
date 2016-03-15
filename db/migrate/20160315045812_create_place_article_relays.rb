class CreatePlaceArticleRelays < ActiveRecord::Migration
  def change
    create_table :place_article_relays do |t|
      t.integer :place_id
      t.integer :article_id

      t.timestamps null: false
    end
  end
end
