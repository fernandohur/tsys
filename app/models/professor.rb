class Professor < ActiveRecord::Base
  attr_accessible :nombre, :password, :username
  has_many :theses

  def Professor.auth(username, password)

    professor = Professor.find_by_username(username)
    if professor
      pass = professor.password
      if pass==password
        return professor
      end
    end
    return nil

  end

  def get_students
    students = []
    theses.each do |t|
      student = t.student
      students.push(student)
    end
    return students
  end

  def get_events
    events = []
    theses.each do |t|
      tmp_events = t.events
      tmp_events.each do |e|
        events.push(e)
      end
    end
    return events
  end

end
