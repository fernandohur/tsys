class Student < ActiveRecord::Base
  attr_accessible :name, :password, :thesis_id, :username
  belongs_to :thesis
end
