class Meeting < ActiveRecord::Base
  attr_accessible :dateMeeting, :noteMeeting, :thesis_id
  belongs_to :thesis

  def start_time
    return dateMeeting
  end
end
