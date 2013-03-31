class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :activity_id
      t.integer :student_id
      t.string :file_url

      t.timestamps
    end
  end
end
