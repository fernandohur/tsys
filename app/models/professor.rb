class Professor < ActiveRecord::Base
  attr_accessible :nombre, :password, :username
  has_many :theses
end
