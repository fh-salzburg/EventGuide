class AddTimecolumns < ActiveRecord::Migration
  def up
   add_column :events, :time_to:, :datetime
   add_column :events, :time_from:, :datetime
  end

  def down
  end
end
