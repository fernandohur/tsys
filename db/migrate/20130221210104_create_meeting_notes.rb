class CreateMeetingNotes < ActiveRecord::Migration
  def change
    create_table :meeting_notes do |t|
      t.string :text
      t.integer :id_meeting

      t.timestamps
    end
  end
end
