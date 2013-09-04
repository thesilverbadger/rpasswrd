class ApiController < ApplicationController
  def get_users
    @users = User.all

    respond_to do |format|
      format.json { render json: @users }
    end
  end

  def add_code
    user = User.find_by_email(params[:email])

    code = Code.new
    code.user_id = user.id
    code.password = params[:password]
    code.username = params[:username]
    code.code = params[:code]
    code.is_deleted = false
    code.save

    respond_to do |format|
      format.json { render json: user }
    end
  end

end
