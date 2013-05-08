class Source < ActiveRecord::Base
  attr_accessible :descripccion, :name, :path, :thesis_id,:category
  belongs_to :thesis
  has_many :notes

  validates :name, :presence => true
  validates :descripccion, :length => {:minimum => 10}

  def Source.get_categories
    categories = []
    Source.all.each do |s|
      categories.append(s.category)
    end
    return categories.to_set

  end

  def Source.get_default_categories
    return ["aplicacion","libro","imagen","sonido","otra","grupo de investigacion"]
  end

end
