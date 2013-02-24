class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :username
      t.string :password
      t.integer :thesis_id

      t.timestamps
    end
  end
end
