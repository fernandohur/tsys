class MeetingTask < ActiveRecord::Base
  attr_accessible :done, :expireDate, :meeting_id, :task
  belongs_to :meeting
end
