class CreateFamilies < ActiveRecord::Migration[5.2]
  def change
    create_table :families do |t|
      t.string :name
      t.string :owner_ids
      t.string :pet_ids

      t.timestamps
    end
  end
end
