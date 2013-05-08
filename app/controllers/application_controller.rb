class ApplicationController < ActionController::Base
  protect_from_forgery

  def get_user_id
    session[:user_id]
  end

  def is_prof
    session[:user_type]==:professor
  end

  def is_student
    session[:user_type]==:student
  end

  def send_home_with_flash(flash_msg)
    flash[:notice]=flash_msg
    redirect_to '/'
  end

  def is_signed_in
    session[:user_id]!=nil
  end

  def get_thesis_id
    session[:thesis_id]
  end

end
