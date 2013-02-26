class Activity < ActiveRecord::Base
  attr_accessible :name
  validates :name, :uniqueness => true
  has_many :products
end
