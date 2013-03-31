class CreateMeetingTask < ActiveRecord::Migration
  def change
    create_table :MeetingTask do |t|
      t.boolean :done
      t.datetime :expireDate
      t.integer :meeting_id
      t.string :task

      t.timestamps
      end
    end

end
