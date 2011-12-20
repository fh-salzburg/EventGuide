class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.integer :number
      t.string :name
      t.string :email
      t.string :mobile
      t.text :interests
      t.integer :number_of_stars

      t.timestamps
    end
  end
end
