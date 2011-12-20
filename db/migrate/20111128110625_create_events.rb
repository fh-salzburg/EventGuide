class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    t.string   "name"
    t.string   "room"
	t.datetime "time_from"
	t.datetime "time_to"
	t.boolean "isAStation"
    t.text     "description"
    t.string   "image"

     t.timestamps
    end
  end
end
