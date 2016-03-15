class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.integer :width
      t.integer :height
      t.string :image
      t.string :original_picture_url
      t.references :item, index: true

      t.timestamps null: false
    end
    add_foreign_key :pictures, :items
  end
end
