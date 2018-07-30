class CreatePlays < ActiveRecord::Migration[5.2]
  def change
    create_table :plays do |t|
      t.integer :pet_id
      t.integer :owner_id
      t.text :notes

      t.timestamps
    end
  end
end
