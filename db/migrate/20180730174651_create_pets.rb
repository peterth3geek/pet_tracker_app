class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :species
      t.string :breed
      t.integer :age
      t.integer :weight
      t.string :img_url

      t.timestamps
    end
  end
end
