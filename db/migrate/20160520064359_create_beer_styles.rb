class CreateBeerStyles < ActiveRecord::Migration
  def change
    create_table :beer_styles do |t|
      t.string :name
      t.integer :full_bodied_ratio
      t.integer :bitter_taste_ratio
      t.integer :aroma_ratio

      t.timestamps null: false
    end
    add_index :beer_styles, :name
  end
end
