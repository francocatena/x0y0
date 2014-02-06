class ProfilesController < ApplicationController
  before_action :authorize, :set_user

  def edit
    @title = t('.title')
  end

  def update
    @title = t('profiles.edit.title')

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to root_url, notice: t('.success') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_user
      @user = current_user
    end

    def user_params
      params.require(:user).permit :name, :lastname, :email, :password, :password_confirmation, :lock_version
    end
end
