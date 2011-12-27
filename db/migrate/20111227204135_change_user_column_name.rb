class ChangeUserColumnName < ActiveRecord::Migration
  def up
	rename_column :users, :type, :usertype
	remove_column :users, :salt
  end

  def down
  end
end
