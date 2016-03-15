class AddThumbnailIdToItem < ActiveRecord::Migration
  def change
    add_column :items, :thumbnail_id, :integer
    add_index :items, :thumbnail_id
  end
end
