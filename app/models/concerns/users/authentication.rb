module Users::Authentication
  extend ActiveSupport::Concern

  included do
    has_secure_password

    before_create { generate_token :auth_token }
  end

  def is_admin?
    true
  end

  private

  def generate_token column
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end
