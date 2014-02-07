class UsersController < ApplicationController
  respond_to :html, :json

  before_action :authorize
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_title, only: [:index, :show, :new, :edit]

  # GET /users
  def index
    @users = User.all

    respond_with @users
  end

  # GET /users/1
  def show
    respond_with @user
  end

  # GET /users/new
  def new
    @user = User.new

    respond_with @user
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @title = t 'users.new.title'
    @user = User.new user_params

    @user.save
    respond_with @user
  end

  # PATCH/PUT /users/1
  def update
    @title = t 'users.edit.title'

    @user.update user_params
    respond_with @user

  rescue ActiveRecord::StaleObjectError
    redirect_to edit_user_url(@user), alert: t('.stale')
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    respond_with @user
  end

  private

    def set_user
      @user = User.find params[:id]
    end

    def set_title
      @title = t '.title'
    end

    def user_params
      params.require(:user).permit :name, :lastname, :email, :password, :password_confirmation, :lock_version
    end
end
