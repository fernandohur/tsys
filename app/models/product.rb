class Product < ActiveRecord::Base
  attr_accessible :desc, :file_url, :name
  validates :file_url, :uniqueness => true
  has_one :activity
end
