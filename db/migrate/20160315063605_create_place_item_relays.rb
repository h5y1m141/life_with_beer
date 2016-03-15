class CreatePlaceItemRelays < ActiveRecord::Migration
  def change
    create_table :place_item_relays do |t|
      t.integer :place_id
      t.integer :item_id

      t.timestamps null: false
    end
  end
end
