class Activity < ActiveRecord::Base
  attr_protected
  belongs_to :thesis
  has_many :comments
end
