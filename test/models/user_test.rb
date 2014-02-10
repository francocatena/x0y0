require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users :franco
  end

  test 'should generate token on create' do
    @user = User.create!(
      name: @user.name,
      lastname: @user.lastname,
      email: 'new@user.com',
      password: '123',
      password_confirmation: '123'
    )

    assert @user.reload.auth_token.present?
  end

  test 'blank attributes' do
    @user.name = ''
    @user.lastname = ''
    @user.email = ''

    assert @user.invalid?
    assert_error @user, :name, :blank
    assert_error @user, :lastname, :blank
    assert_error @user, :email, :blank
  end

  test 'unique email' do
    @user.email = users(:john).email

    assert @user.invalid?
    assert_error @user, :email, :taken
  end

  test 'email format' do
    @user.email = 'bad_email'

    assert @user.invalid?
    assert_error @user, :email, :invalid
  end

  test 'email downcase and strip' do
    @user.email = ' FRANCOCatena@gmail.com '

    assert @user.valid?
    assert_equal 'francocatena@gmail.com', @user.email
  end

  test 'attributes length' do
    @user.name = 'abcde' * 52
    @user.lastname = 'abcde' * 52
    @user.email = 'abcde' * 52

    assert @user.invalid?
    assert_error @user, :name, :too_long, count: 255
    assert_error @user, :lastname, :too_long, count: 255
    assert_error @user, :email, :too_long, count: 255
  end

  test 'password expired' do
    @user.password_reset_sent_at = Time.zone.now

    assert !@user.password_expired?

    @user.password_reset_sent_at = 3.hours.ago

    assert @user.password_expired?
  end
end
