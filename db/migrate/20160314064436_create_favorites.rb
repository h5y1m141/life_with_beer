class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :favoriteable_id
      t.string :favoriteable_type

      t.timestamps null: false
    end
    add_index :favorites, [:favoriteable_id, :favoriteable_type]
  end
end
