class Thesis < ActiveRecord::Base
  attr_accessible :name, :professor_id, :thesisType
  has_many :sources
end
