class Meeting < ActiveRecord::Base
  attr_accessible :dateMeeting, :noteMeeting, :path, :thesis_id
  belongs_to :thesis
  has_many :meeting_notes
  has_many :meeting_tasks

end
