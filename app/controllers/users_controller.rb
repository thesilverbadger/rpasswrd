class UsersController < ApplicationController

  skip_before_filter :require_login
  def new
    @user = User.new
  end

  skip_before_filter :require_login
  def create
    @user = User.new(params[:user])
    if @user.save
      Notifier.signup_email(@user).deliver
      redirect_to root_url, :notice => 'Signed up!'
    else
      render 'new'
    end
  end

end
