class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.datetime :dateMeeting
      t.string :noteMeeting
      t.integer :thesis_id

      t.timestamps
    end
  end
end
