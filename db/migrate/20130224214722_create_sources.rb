class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :name
      t.string :dir
      t.string :path
      t.string :descripccion
      t.integer :thesis_id

      t.timestamps
    end
  end
end
