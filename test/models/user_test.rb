require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:franco)
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

  test 'validates attributes length' do
    @user.name = 'abcde' * 52
    @user.lastname = 'abcde' * 52
    @user.email = 'abcde' * 52
    
    assert @user.invalid?
    assert_error @user, :name, :too_long, count: 255
    assert_error @user, :lastname, :too_long, count: 255
    assert_error @user, :email, :too_long, count: 255
  end
end
