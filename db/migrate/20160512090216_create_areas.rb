class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :name
      t.string :geohash
      t.decimal :latitude, precision: 9, scale: 6
      t.decimal :longitude, precision: 9, scale: 6
      
      t.timestamps null: false
    end
    add_index :areas, :name
    add_index :areas, :geohash
  end
end
