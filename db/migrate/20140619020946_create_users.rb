class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :oauth_token
      t.datetime :oauth_expires_at
      t.string :soundcloud_user_id
      t.string :soundcloud_username
      t.string :soundcloud_access_token
      t.string :soundcloud_refresh_token
      t.string :soundcloud_expires_at

      t.timestamps
    end
  end
end
