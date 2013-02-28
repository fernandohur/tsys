class Thesis < ActiveRecord::Base
  attr_accessible :name, :professor_id, :thesisType
  validates :name, :uniqueness => true
  validates :name, :length => { :maximum => 30 }
  has_many :sources
  has_many :activities
  belongs_to :student
end
