class Meeting < ActiveRecord::Base
  attr_accessible :dateMeeting, :noteMeeting, :thesis_id
  belongs_to :thesis
end
