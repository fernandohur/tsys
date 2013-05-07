class SessionsController < ApplicationController

  def login
    login = params[:login]
    password = params[:password]
    user_type = params[:user_type]
    session[:user_id]=Student.first
    session[:user_type]=user_type
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
