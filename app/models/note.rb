class Note < ActiveRecord::Base
  attr_accessible :noteText, :source_id
  belongs_to :source
end
