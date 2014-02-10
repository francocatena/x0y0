module Users::PasswordReset
  extend ActiveSupport::Concern

  def prepare_password_reset
    generate_token :password_reset_token
    self.password_reset_sent_at = Time.zone.now
    save!
  end

  def password_expired?
    password_reset_sent_at < 2.hours.ago
  end
end
