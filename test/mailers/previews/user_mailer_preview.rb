# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def password_reset
    user = User.unscoped.first

    user.prepare_password_reset

    UserMailer.password_reset user
  end
end
