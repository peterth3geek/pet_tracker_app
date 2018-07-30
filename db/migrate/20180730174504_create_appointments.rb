class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.integer :pet_id
      t.text :notes
      t.string :title
      t.datetime :date
      t.integer :owner_id

      t.timestamps
    end
  end
end
