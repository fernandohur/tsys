class Activity < ActiveRecord::Base
  attr_accessible :name, :thesis_id
  belongs_to :thesis
  has_many :comments
end
