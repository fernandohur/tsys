class Event < ActiveRecord::Base
  attr_accessible :allDay, :end, :start, :title

  belongs_to :thesis

end
