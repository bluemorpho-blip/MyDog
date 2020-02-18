class CreateVeterinarians < ActiveRecord::Migration[6.0]
  def change
    create_table :veterinarians do |t|
      t.string :name
      t.boolean :admin, default: true
      t.string :password_digest

      t.timestamps
    end
  end
end
