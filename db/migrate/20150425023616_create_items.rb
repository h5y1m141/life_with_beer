class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name, null: false, index: true
      t.string :url, null: false
      t.integer :original_price
      t.boolean :discounted
      t.integer :discount_price
      t.text :description
      t.integer :store_id, null: false

      t.timestamps null: false
    end
  end
end
