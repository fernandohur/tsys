class CreateAnotations < ActiveRecord::Migration
  def change
    create_table :anotations do |t|
      t.string :id_source
      t.string :texto

      t.timestamps
    end
  end
end
