class Source < ActiveRecord::Base
  attr_accessible :descripccion, :name, :path, :thesis_id,:category
  belongs_to :thesis
  has_many :notes



end
