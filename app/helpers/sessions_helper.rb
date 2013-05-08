module SessionsHelper
  def get_user_type
    request.session[:user_type]
  end

  def is_signed_in
    request.session[:user_id] != nil
  end

end
