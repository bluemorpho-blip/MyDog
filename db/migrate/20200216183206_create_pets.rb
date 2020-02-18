class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :dog_cat
      t.string :breed
      t.integer :veterinarian_id
      t.integer :user_id

      t.timestamps
    end
  end
end
