module Users::Profile
  extend ActiveSupport::Concern

  included do
    before_action :load_current_user, only: [:edit_profile, :update_profile]
  end

  # GET /users/1/edit_profile
  def edit_profile
    @title = t('view.users.edit_profile')
  end
  
  # PATCH /users/1/update_profile
  def update_profile
    @title = t('view.users.edit_profile')
    
    respond_to do |format|
      if @user.update_attributes(user_params)
        format.html { redirect_to(edit_profile_user_url(@user), notice: t('view.users.profile_correctly_updated')) }
      else
        format.html { render action: 'edit_profile' }
      end
    end

  rescue ActiveRecord::StaleObjectError
    flash.alert = t('view.users.stale_object_error')
    redirect_to edit_profile_user_url(@user)
  end

  private

  def load_current_user
    @user = current_user
  end
end
