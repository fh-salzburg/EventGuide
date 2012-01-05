class ChangeUserColumnName < ActiveRecord::Migration
  def up
	#add_column :users, :userstype, :string
	#remove_column :users, :salt
  end

  def down
  end
end
