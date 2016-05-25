class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :name
      t.string :geohash
      t.decimal :latitude, precision: 9, scale: 6
      t.decimal :longitude, precision: 9, scale: 6
      t.boolean :north_direction, default: true, null: false
      t.boolean :northeast_direction, default: true, null: false
      t.boolean :east_direction, default: true, null: false
      t.boolean :southeast_direction, default: true, null: false
      t.boolean :south_direction, default: true, null: false
      t.boolean :southwest_direction, default: true, null: false
      t.boolean :west_direction, default: true, null: false
      t.boolean :northwest_direction, default: true, null: false

      t.timestamps null: false
    end
    add_index :areas, :name
    add_index :areas, :geohash
  end
end
