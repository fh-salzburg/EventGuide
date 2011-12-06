class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name
      t.integer :room
      t.string :description
      t.string :image
      t.boolean :isAQuiz
      t.time :atTime

      t.timestamps
    end
  end
  
  def self.down
    drop_table :events
  end
end
