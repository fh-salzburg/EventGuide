class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :guide_id
      t.integer :visitor_id
      t.boolean :is_in_group

      t.timestamps
    end
  end
end
