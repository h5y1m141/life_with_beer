class CreateItemTagRelays < ActiveRecord::Migration
  def change
    create_table :item_tag_relays do |t|
      t.integer :item_id
      t.integer :tag_id
      t.integer :score

      t.timestamps null: false
    end
  end
end
