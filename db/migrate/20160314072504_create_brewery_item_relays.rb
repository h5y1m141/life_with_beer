class CreateBreweryItemRelays < ActiveRecord::Migration
  def change
    create_table :brewery_item_relays do |t|
      t.integer :brewery_id
      t.integer :item_id
      t.timestamps null: false
    end
  end
end
