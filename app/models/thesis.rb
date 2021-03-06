class Thesis < ActiveRecord::Base
  attr_accessible :name, :student_id
  validates :name, :uniqueness => true
  validates_length_of :name, :minimum => 5, :maximum => 15, :allow_blank => false
  validates_presence_of :student_id
  has_many :sources
  has_many :activities
  has_many :meetings
  has_many :events
  belongs_to :student
  belongs_to :professor


  def title
    name
  end

end
