class CreateBrewerySocialAccountRelays < ActiveRecord::Migration
  def change
    create_table :brewery_social_account_relays do |t|
      t.integer :brewery_id
      t.integer :social_account_id

      t.timestamps null: false
    end
  end
end
