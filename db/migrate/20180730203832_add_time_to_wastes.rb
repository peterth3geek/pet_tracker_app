class AddTimeToWastes < ActiveRecord::Migration[5.2]
  def change
    add_column :wastes, :time, :datetime
  end
end
