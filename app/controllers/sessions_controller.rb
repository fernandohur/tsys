class SessionsController < ApplicationController

  def login
    login = params[:login]
    password = params[:password]
    user_type = params[:user_type]

    puts password + ' ' + login + ' ' + user_type

    if user_type == :professor
      user = Professor.auth login, password
    else
      user = Student.auth login, password
    end

    if user == nil
      flash[:notice] = 'User not found'

    else
      session[:user_id] = user.id
      session[:user_type] = user_type
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
