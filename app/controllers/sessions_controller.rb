class SessionsController < ApplicationController

  def login
    login = params[:login]
    password = params[:password]
    user_type = params[:user_type]
    if user_type == :professor.to_s
      Professor.new(:nombre => login, :password => password, :username => login).save
      user = Professor.auth login, password
    else
      user = Student.auth login, password
      if user!=nil
        session[:thesis_id]=user.thesis_id
      end
    end

    if user!=nil
      session[:user_id] = user.id
      session[:user_type] = user_type.intern
      if is_prof
        redirect_to '/professors/me'
      else
        redirect_to '/'
      end
    else
      send_home_with_flash 'username or password not found '
    end

  end

  def logout
    session[:user_id] = nil
    session[:user_type] = nil
    send_home_with_flash 'log out successful'
  end

end
