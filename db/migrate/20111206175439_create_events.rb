class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.integer :raum
      t.string :beschreibung
      t.string :bild

      t.timestamps
    end
  end
end
