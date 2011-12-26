class UserPasswortHashAndSalt < ActiveRecord::Migration
  def up
	change_table :users do |t|
		t.string	"password_salt"
	end
  end

  def down
  end
end
