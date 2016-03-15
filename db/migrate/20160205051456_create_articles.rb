class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.integer :publish_status

      t.timestamps null: false
    end
  end
end
