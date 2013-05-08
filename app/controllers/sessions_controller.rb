class SessionsController < ApplicationController

  def login
    login = params[:login]
    password = params[:password]
    user_type = params[:user_type]
    if user_type == "professor"
      professor = Professor.find_by_username(login)
      if password == professor.password
        session[:user_id] = Professor.find_by_username(login).id
        session[:user_type] = "professor"
      else
        #wrong login
        flash[:error] = "Wrong login/password combination for a professor"
      end
    else
      student = Student.find_by_username(login)
      if !student.blank? && student.password == password
        session[:user_id] = Student.find_by_username(login).id
        session[:user_type] = "student"
      else
        flash[:error] = "Wrong login/password combination for a student"
      end

    end
    redirect_to '/'


  end

  def logout
    session[:user_id] = nil
    session[:user_type] = nil
    flash[:notice] = "log out successful"
    redirect_to "/"
  end

  def get_student(login,password)
    Student.first
  end
end
