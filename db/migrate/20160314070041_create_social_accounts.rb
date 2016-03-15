class CreateSocialAccounts < ActiveRecord::Migration
  def change
    create_table :social_accounts do |t|
      t.integer :account_type
      t.string :name
      t.string :url
      t.string :comment

      t.timestamps null: false
    end
  end
end
