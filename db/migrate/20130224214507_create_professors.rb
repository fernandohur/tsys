class CreateProfessors < ActiveRecord::Migration
  def change
    create_table :professors do |t|
      t.string :nombre
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
