class ProfilesController < ApplicationController
  respond_to :html, :json

  before_action :authorize, :set_user

  def edit
    @title = t '.title'
  end

  def update
    @title = t 'profiles.edit.title'

    @user.update user_params
    respond_with @user, location: root_url
  end

  private

    def set_user
      @user = current_user
    end

    def user_params
      params.require(:user).permit :name, :lastname, :email, :password, :password_confirmation, :lock_version
    end
end
