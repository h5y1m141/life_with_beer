class CreateSocialAccounts < ActiveRecord::Migration
  def change
    create_table :social_accounts do |t|
      t.integer :account_type, null: false
      t.string :url, null: false
      t.string :comment

      t.timestamps null: false
    end
  end
end
