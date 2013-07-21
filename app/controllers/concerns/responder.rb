module Responder
  extend ActiveSupport::Concern

  private

  def creation_response
    respond_to do |format|
      if resource.save
        respond_successful_creation format
      else
        respond_with_error format, 'new'
      end
    end
  end

  def update_response
    respond_to do |format|
      if resource.update resource_params
        respond_successful_update format
      else
        respond_with_error format, 'edit'
      end
    end
  end

  def destroy_response
    resource.destroy

    respond_to do |format|
      format.html { redirect_to resources_url, notice: t('.success') }
      format.json { head :no_content }
    end
  end

  def respond_with_error format, action
    format.html { render action: action }
    format.json { render json: resource.errors, status: :unprocessable_entity }
  end

  def respond_successful_update format
    format.html { redirect_to resource, notice: t('.success') }
    format.json { head :no_content }
  end

  def respond_successful_creation format
    format.html { redirect_to resource, notice: t('.success') }
    format.json { render action: 'show', status: :created, location: @user }
  end
end
