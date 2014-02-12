class PasswordResetsController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  before_action :set_title

  def new
  end

  def create
    user = User.find_by email: params[:email]

    if user
      user.prepare_password_reset
      UserMailer.password_reset(user).deliver

      redirect_to root_url, notice: t('.notice', scope: :flash)
    else
      flash.now[:alert] = t '.not_found', scope: :flash
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.password_expired?
      redirect_to new_password_reset_path, alert: t('.expired', scope: :flash)
    elsif @user.update(user_params)
      redirect_to root_url, notice: t('.notice', scope: :flash)
    else
      render 'edit'
    end
  end

  private

    def set_user
      @user = User.find_by! password_reset_token: params[:id]
    end

    def user_params
      params.require(:user).permit :password, :password_confirmation
    end
end
