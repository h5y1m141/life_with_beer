class AddSortKeyToArticleElement < ActiveRecord::Migration
  def change
    add_column :article_elements, :sory_key, :integer
    add_index :article_elements, :sory_key
  end
end
