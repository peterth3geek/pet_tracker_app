class AddTimeToFoods < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :time, :datetime
  end
end
