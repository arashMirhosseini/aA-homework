class ApplicationController < ActionController::Base

  helper_method :current_user

  def log_in!(user)
    @current_user = user
    session[:session_token] = user.session_token
  end

  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= find_by(session_token: session[:session_token])
  end

  def log_out!
    current_user.try(:reset_session_token!)
    session_token[:session_token] = nil
  end
end
