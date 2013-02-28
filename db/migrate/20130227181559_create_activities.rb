class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.integer :thesis_id

      t.timestamps
    end
  end
end
