class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.integer :activity_id

      t.timestamps
    end
  end
end
