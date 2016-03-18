class CreateBreweries < ActiveRecord::Migration
  def change
    create_table :breweries do |t|
      t.string :name, null: false
      t.string :web_site
      t.string :image

      t.timestamps null: false
    end
  end
end
