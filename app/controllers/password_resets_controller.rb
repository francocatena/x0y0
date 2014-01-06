class PasswordResetsController < ApplicationController
  def new
    @title = t '.title'
  end

  def create
    @title = t 'password_resets.new.title'
    user = User.find_by email: params[:email]

    if user
      user.prepare_password_reset
      UserMailer.password_reset(user).deliver

      redirect_to root_url, notice: t('.success')
    else
      flash.now[:alert] = t '.not_found'
      render 'new'
    end
  end

  def edit
    @title = t '.title'
    @user = User.find_by! password_reset_token: params[:id]
  end

  def update
    @title = t 'password_resets.edit.title'
    @user = User.find_by! password_reset_token: params[:id]

    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, alert: t('.expired')
    elsif @user.update_attributes(user_params)
      redirect_to root_url, notice: t('.success')
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
