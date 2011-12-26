class UserPasswortHashAndSalt < ActiveRecord::Migration
  def up
	change_table :users do |t|
		t.string	"password_hash"
		t.string	"password_salt"
	end
	remove_column :users, :password
  end

  def down
  end
end
