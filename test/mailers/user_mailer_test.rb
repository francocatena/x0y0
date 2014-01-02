require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test 'password_reset' do
    user = users(:franco)
    mail = UserMailer.password_reset(user)

    assert_equal I18n.t('user_mailer.password_reset.subject'), mail.subject
    assert_equal [user.email], mail.to
    assert_equal [APPLICATION['email']], mail.from
    assert_match user.name, mail.body.encoded
  end
end
