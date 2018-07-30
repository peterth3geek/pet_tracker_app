class AddTimeToPlays < ActiveRecord::Migration[5.2]
  def change
    add_column :plays, :time, :datetime
  end
end
