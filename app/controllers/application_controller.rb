class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||= User.find_by(auth_token: cookies[:auth_token]) if cookies[:auth_token]
  end
  helper_method :current_user

  def authorize
    Rack::MiniProfiler.authorize_request if current_user.try :is_admin?

    redirect_to login_url, alert: t('messages.not_authorized') unless current_user
  end
end
