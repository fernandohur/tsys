class Product < ActiveRecord::Base
  attr_accessible :activity_id, :file_url, :name, :student_id
  validates_uniqueness_of :name, :message => "Sorry, you can't have two or more products with the same name."
  belongs_to :Student
  has_one :activity
  default_scope order('created_at DESC')

  def self.search(search)
    if search
      find(:all,:conditions => ['name LIKE ?',"%#{search}%"])
    else
      find(:all)
    end
  end
end
