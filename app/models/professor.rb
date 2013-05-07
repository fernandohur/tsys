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

end
