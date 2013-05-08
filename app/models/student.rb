class Student < ActiveRecord::Base
  attr_accessible :name, :password, :thesis_id, :username
  has_one :thesis
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