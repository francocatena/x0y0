module Responder
  extend ActiveSupport::Concern

  private

  def create_and_respond
    respond_to do |format|
      if resource.save
        yield if block_given?
        respond_successful_creation format
      else
        respond_with_error format, 'new'
      end
    end
  end

  def update_and_respond
    respond_to do |format|
      if resource.update resource_params
        yield if block_given?
        respond_successful_update format
      else
        respond_with_error format, 'edit'
      end
    end
  rescue ActiveRecord::StaleObjectError
    redirect_to edit_resource_url, alert: t('.stale_object_error')
  end

  def destroy_and_respond
    resource.destroy

    respond_to do |format|
      format.html { redirect_to after_destroy_url, notice: t('.success') }
      format.json { head :no_content }
    end
  end

  def respond_with_error format, action
    format.html { render action: action }
    format.json { render json: resource.errors, status: :unprocessable_entity }
  end

  def respond_successful_update format
    format.html { redirect_to after_update_url, notice: t('.success') }
    format.json { head :no_content }
  end

  def respond_successful_creation format
    format.html { redirect_to after_create_url, notice: t('.success') }
    format.json { render action: 'show', status: :created, location: after_create_url }
  end
end
