class Product < ActiveRecord::Base
  attr_accessible :activity_id, :file_url, :name
  belongs_to :activity
end
