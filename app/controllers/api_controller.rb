class ApiController < ApplicationController
  def get_users
    @users = User.all

    respond_to do |format|
      format.json { render json: @users }
    end
  end

  def add_code
    user = User.find_by_email(params[:email])

    code = Code.find_by_code(params[:code])

    if !code then
      code = Code.new
      code.user_id = user.id
      code.password = params[:password]
      code.username = params[:username]
      code.code = params[:code]
      code.is_deleted = false
      code.save
    end


    respond_to do |format|
      format.json { render json: user }
    end
  end
  
  def get_codes
    if params[:key] == 'iorqo893fnkwk' then
      @codes = Code.where('is_deleted = ?', false)

      respond_to do |format|
        format.json { render :partial => 'api/get_codes.json.erb' } #, @codes.to_json(:only => [:id, :code, :password, :username, :user_id]) }
      end
    end
  end

end
