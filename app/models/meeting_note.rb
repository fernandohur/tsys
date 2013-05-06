class MeetingNote < ActiveRecord::Base
  attr_accessible :meeting_id, :noteText, :path
  belongs_to :meeting
end
