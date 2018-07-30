class CreateConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :conditions do |t|
      t.integer :pet_id
      t.text :notes
      t.string :title

      t.timestamps
    end
  end
end
