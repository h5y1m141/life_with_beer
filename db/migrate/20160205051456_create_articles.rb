class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :thumbnail
      t.integer :publish_status

      t.timestamps null: false
    end
    add_index :articles, :title
  end
end
