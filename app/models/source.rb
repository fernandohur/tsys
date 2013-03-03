class Source < ActiveRecord::Base
  attr_accessible :descripccion, :name, :path, :thesis_id
  belongs_to :thesis
  has_many :notes



end
