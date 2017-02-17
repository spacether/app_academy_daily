class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def login!(user)
    # reset session token on user and session
    session[:session_token] = user.reset_session_token!
  end

  def logout!
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def logged_in?
    !current_user.nil?
  end

  def ensure_logged_in
    redirect_to new_session_url unless logged_in?
  end

  def method_and_goto(item, method, good_place, bad_place, params = nil)
    if (params.nil? ? item.send(method) : item.send(method, params))
      redirect_to good_place
    else
      flash[:errors] = item.errors.full_messages
      redirect_to bad_place
    end
  end

  helper_method :current_user
  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

end
