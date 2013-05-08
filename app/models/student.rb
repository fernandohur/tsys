class Student < ActiveRecord::Base
  attr_protected
  attr_accessible :thesis_id, :name, :username, :password
  validates_presence_of :name, :username, :password
  belongs_to :thesis
  validates_uniqueness_of :username

  def Student.auth(username, password)
    student = Student.find_by_username(username)
    if student
      pass = student.password
      if pass==password
        return student
      end
    end
    return nil
  end

  def get_events
    thesis.events
  end


end