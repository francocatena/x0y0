require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test 'password_reset' do
    user = users(:franco)
    mail = UserMailer.password_reset(user)

    assert_equal I18n.t('user_mailer.password_reset.subject'), mail.subject
    assert_equal [user.email], mail.to
    assert_equal [ENV['EMAIL_ADDRESS']], mail.from
    assert_match user.name, mail.html_part.body.decoded
    assert_match user.name, mail.text_part.body.decoded
  end
end
