class Event < ActiveRecord::Base
  attr_accessible :allDay, :end, :start, :title
end
