class MeetingNote < ActiveRecord::Base
  attr_accessible :meeting_id, :noteText
  belongs_to :meeting
end
