class CreateMeds < ActiveRecord::Migration[6.0]
  def change
    create_table :meds do |t|
      t.string :name
      t.string :dose
      t.text :instructions
      t.integer :pet_id
      t.integer :user_id

      t.timestamps
    end
  end
end
