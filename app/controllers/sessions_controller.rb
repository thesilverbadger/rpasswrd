class SessionsController < ApplicationController

  skip_before_filter :require_login
  def new
  end

  def create
    user = User.find_by_lower_email(params[:email].downcase)
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

end
