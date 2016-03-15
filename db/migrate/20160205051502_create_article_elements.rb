class CreateArticleElements < ActiveRecord::Migration
  def change
    create_table :article_elements do |t|
      t.string :tag_name
      t.text :element_data
      t.references :article, index: true

      t.timestamps null: false
    end
    add_foreign_key :article_elements, :articles
  end
end
