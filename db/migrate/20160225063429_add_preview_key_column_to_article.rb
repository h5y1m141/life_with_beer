class AddPreviewKeyColumnToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :preview_key, :string
    add_index :articles, :preview_key
  end
end
