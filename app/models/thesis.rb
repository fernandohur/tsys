class Thesis < ActiveRecord::Base
  attr_accessible :name, :student_id
  validates :name, :uniqueness => true
  validates_length_of :name, :minimum => 5, :maximum => 15, :allow_blank => false
  has_many :sources
  has_many :activities
  has_many :meetings
  belongs_to :student
  belongs_to :professor

  def title
    name
  end

end
