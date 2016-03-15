class RemoveColumnTags < ActiveRecord::Migration
  def change
    remove_foreign_key :tags, :item
    remove_index :tags, :item_id
    remove_column :tags, :item_id, :integer, index: true, foreign_key: true
  end
end
