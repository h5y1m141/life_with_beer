class CreateArticlePictureRelays < ActiveRecord::Migration
  def change
    create_table :article_picture_relays do |t|
      t.integer :article_id
      t.integer :picture_id

      t.timestamps null: false
    end
  end
end
