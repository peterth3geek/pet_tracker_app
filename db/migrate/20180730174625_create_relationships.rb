class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.string :title
      t.integer :pet_id
      t.integer :owner_id

      t.timestamps
    end
  end
end
