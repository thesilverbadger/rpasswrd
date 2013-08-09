class CodesController < ApplicationController
  skip_before_filter :require_login, :only => :generate

  # GET /codes
  # GET /codes.json
  def index
    @user_id = session[:user_id]
    @codes = Code.where('user_id = ? and is_deleted = ?', @user_id, false) #.find_by_user_id(@user_id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @codes }
    end
  end

  # GET /codes/1
  # GET /codes/1.json
  def show
    @code = Code.find_by_id_and_user_id(params[:id], session[:user_id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @code }
    end
  end

  # GET /codes/new
  # GET /codes/new.json
  def new
    @code = Code.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @code }
    end
  end

  # GET /codes/1/edit
  def edit
    @code = Code.find_by_id_and_user_id(params[:id], session[:user_id])
  end

  # POST /codes
  # POST /codes.json
  def create
    @code = Code.new(params[:code])
    @code.user_id = session[:user_id]

    respond_to do |format|
      if @code.save
        format.html { redirect_to codes_path, notice: 'Code was successfully created.' }
        format.json { render json: @code, status: :created, location: @code }
      else
        format.html { render action: "new" }
        format.json { render json: @code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /codes/1
  # PUT /codes/1.json
  def update
    @code = Code.find_by_id_and_user_id(params[:id], session[:user_id])

    respond_to do |format|
      if @code.update_attributes(params[:code])
        format.html { redirect_to codes_url, notice: 'Code was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /codes/1
  # DELETE /codes/1.json
  def destroy
    @code = Code.find_by_id_and_user_id(params[:id], session[:user_id])
    @code.destroy

    respond_to do |format|
      format.html { redirect_to codes_url, notice: 'Code deleted' }
      format.json { head :no_content }
    end
  end


  def generate
    random = [*('a'..'z'),*('0'..'9')].shuffle[0,12].join

    @code = '{ "randomCode" : "' + random + '" }'

    respond_to do |format|
      format.json { render json: @code }
    end
  end
end
