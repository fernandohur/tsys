class Student < ActiveRecord::Base
  attr_accessible :name, :password, :thesis_id, :username
  validates_presence_of :name, :username, :password
  belongs_to :thesis
  validates_uniqueness_of :username
end