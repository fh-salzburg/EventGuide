class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.integer :room
      t.textarea :description
      t.string :image

      t.timestamps
    end
  end
end
