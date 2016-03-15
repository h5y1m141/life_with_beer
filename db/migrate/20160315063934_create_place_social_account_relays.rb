class CreatePlaceSocialAccountRelays < ActiveRecord::Migration
  def change
    create_table :place_social_account_relays do |t|
      t.integer :place_id
      t.integer :social_account_id

      t.timestamps null: false
    end
  end
end
