class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.string :contact_method
      t.string :password_digest
      t.boolean :admin, default: false
      t.integer :med_id

      t.string :token
      t.string :refresh_token
      t.string :uid
      t.string :provider
      t.string :oauth_expires_at


      t.timestamps
    end
  end
end
