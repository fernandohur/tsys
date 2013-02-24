class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :noteText
      t.integer :source_id

      t.timestamps
    end
  end
end
