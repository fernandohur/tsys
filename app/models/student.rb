class Student < ActiveRecord::Base
  attr_accessible :name, :password, :thesis_id, :username
  belongs_to :thesis
  validates_uniqueness_of :username
end