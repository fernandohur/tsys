class SessionsController < ApplicationController
  def login
    login = params[:login]
    password = params[:password]
    user_type = params[:user_type]

    user_id = get_student_id_from_credentials(login,password)

    if user_id == nil
      flash[:notice] = "Login or password incorrect"
      redirect_to "/"
    else
      session[:user_id] = user_id
      session[:user_type] = user_type
      flash[:success] = "Login successful"
      if user_type == :student
          redirect_to student_path(user_id)
      elsif user_type == :professor
          redirect_to professor_path(user_id)
      end
    end

  end

  def logout
    session[:user_id] = nil
    session[:user_type] = nil
    flash[:success] = "log out successful"
    redirect_to "/"
  end

  def create
  end
end
