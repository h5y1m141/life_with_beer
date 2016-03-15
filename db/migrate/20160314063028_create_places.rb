class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name, null: false
      t.integer :prefecture_id, null: false
      t.string :address, null: false
      t.string :address2
      t.string :phone_number
      t.decimal :latitude, precision: 9, scale: 6
      t.decimal :longitude, precision: 9, scale: 6
      t.integer :place_type, null: false, default: 0

      t.timestamps null: false
    end
  end
end
