class CreateTheses < ActiveRecord::Migration
  def change
    create_table :theses do |t|
      t.string :name
      t.integer :student_id

      t.timestamps
    end
  end
end
