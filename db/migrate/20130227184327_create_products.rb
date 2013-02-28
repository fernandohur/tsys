class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :file_url
      t.integer :activity_id

      t.timestamps
    end
  end
end
