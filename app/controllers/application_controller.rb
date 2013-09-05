class ApplicationController < ActionController::Base
  protect_from_forgery

  #before_filter :require_login, :except => [:get_users, :add_code]

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    unless current_user
      redirect_to new_sessions_path
    end
  end

  helper_method :current_user
end
