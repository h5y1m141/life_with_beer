class CreateItemFavorites < ActiveRecord::Migration
  def change
    create_table :item_favorites do |t|
      t.integer :resource_id
      t.string :resource_type
      t.text :comment

      t.timestamps null: false
    end
  end
end
