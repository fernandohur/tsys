class Comment < ActiveRecord::Base
  attr_accessible :activity_id, :body
  belongs_to :activity
end
