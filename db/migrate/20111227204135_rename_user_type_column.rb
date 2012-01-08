class RenameUserTypeColumn < ActiveRecord::Migration
  def up
	rename_column :users, :type, :usertype
  end

  def down
 	rename_column :users, :usertype, :type
  end
end
