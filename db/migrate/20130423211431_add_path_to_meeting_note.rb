class AddPathToMeetingNote < ActiveRecord::Migration
  def change
    add_column :meeting_notes, :path, :string
  end
end
