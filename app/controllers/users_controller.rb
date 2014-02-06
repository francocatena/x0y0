class UsersController < ApplicationController
  include Responder

  before_action :authorize
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_title, only: [:index, :show, :new, :edit]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @title = t 'users.new.title'
    @user = User.new(user_params)

    create_and_respond
  end

  # PATCH/PUT /users/1
  def update
    @title = t 'users.edit.title'

    update_and_respond
  end

  # DELETE /users/1
  def destroy
    destroy_and_respond
  end

  private

  def set_user
    @user = User.find params[:id]
  end

  def set_title
    @title = t '.title'
  end

  def user_params
    params.require(:user).permit(:name, :lastname, :email, :password, :password_confirmation, :lock_version)
  end
  alias_method :resource_params, :user_params

  def resource
    @user
  end
end
