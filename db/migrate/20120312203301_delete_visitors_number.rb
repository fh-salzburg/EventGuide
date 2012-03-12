class DeleteVisitorsNumber < ActiveRecord::Migration
  def up
    remove_column :visitors, :number
  end

  def down
    add_column :visitors, :number, :integer
  end
end
