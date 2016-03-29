class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name, null: false, index: true
      t.string :url, null: false
      t.integer :original_price
      t.boolean :discounted
      t.integer :discount_price
      t.text :description
      t.text :image
      t.text :original_image_url, null: false
      t.integer :ibu, null: false, default: 10
      t.references :brewery, index: true

      t.timestamps null: false
    end
  end
end
