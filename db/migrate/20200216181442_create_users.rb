class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :phone_number
      t.string :contact_method
      t.string :password_digest
      t.boolean :admin, default: false
      t.integer :med_id

      t.timestamps
    end
  end
end
