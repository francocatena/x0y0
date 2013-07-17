class UsersController < ApplicationController
  before_action :authorize
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @title = t('.title')
    @users = User.all
  end

  # GET /users/1
  def show
    @title = t('.title')
  end

  # GET /users/new
  def new
    @title = t('.title')
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @title = t('.title')
  end

  # POST /users
  def create
    @title = t('users.new.title')
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: t('.success') }
        format.json { render action: 'show', status: :created, location: @user }
      else
        respond_with_error format, 'new'
      end
    end
  end

  # PATCH/PUT /users/1
  def update
    @title = t('users.edit.title')

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: t('.success') }
        format.json { head :no_content }
      else
        respond_with_error format, 'edit'
      end
    end
  rescue ActiveRecord::StaleObjectError
    redirect_to edit_user_url(@user), alert: t('.stale_object_error')
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private

  def respond_with_error(format, action)
    format.html { render action: action }
    format.json { render json: @user.errors, status: :unprocessable_entity }
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :lastname, :email, :password, :password_confirmation)
  end
end
