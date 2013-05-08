class Student < ActiveRecord::Base
  attr_accessible :name, :password, :thesis_id, :username
<<<<<<< HEAD
  validates_presence_of :name, :username, :password
  belongs_to :thesis
=======
  has_one :thesis
>>>>>>> 67967040023fb5cb9aba485e52e373243ec07241
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