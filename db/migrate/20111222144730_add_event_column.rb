class AddEventColumn < ActiveRecord::Migration
  def up
    change_table :events do |t|
    	t.text		"short_description"
    end
  end

  def down
  end
end
