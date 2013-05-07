class SessionsController < ApplicationController

  def login
    login = params[:login]
    password = params[:password]
    user_type = params[:user_type]
    session[:user_id]=Student.first
    session[:login]=login
    session[:thesis_id]=Student.find_by_username(session[:login]).thesis_id

    puts "--------------------------------------------"
    puts login
    puts password
    puts user_type
    puts session[:user_id]
    puts session[:login]
    puts Student.first
    puts Student.find_by_username("adriana").id
    puts "--------------------------------------------"

    if user_type=:student
      if Student.find_by_username(login) !=nil
        redirect_to "/students/"+(Student.find_by_username(login).id).to_s
      else
        redirect_to "/"
      end

    end

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
