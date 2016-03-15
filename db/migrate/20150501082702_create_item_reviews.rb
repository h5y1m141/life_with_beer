class CreateItemReviews < ActiveRecord::Migration
  def change
    create_table :item_reviews do |t|
      t.integer :resource_id
      t.string :resource_type
      t.text :comment

      t.timestamps null: false
    end
  end
end
