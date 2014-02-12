class ProfilesController < ApplicationController
  respond_to :html, :json

  before_action :authorize, :set_user, :set_title

  def edit
  end

  def update
    @user.update user_params
    respond_with @user, location: root_url

  rescue ActiveRecord::StaleObjectError
    redirect_to profile_path, alert: t('.stale', scope: :flash)
  end

  private

    def set_user
      @user = current_user
    end

    def user_params
      params.require(:user).permit :name, :lastname, :email, :password, :password_confirmation, :lock_version
    end
end
