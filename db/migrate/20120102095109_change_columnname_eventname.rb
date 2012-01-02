class ChangeColumnnameEventname < ActiveRecord::Migration
  def up
    rename_column(:events, :name, :title)
  end

  def down
  end
end
