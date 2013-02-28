class Source < ActiveRecord::Base
  attr_accessible :descripccion, :dir, :name, :path, :thesis_id
  belongs_to :thesis
  has_many :notes



end
