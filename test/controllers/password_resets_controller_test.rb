require 'test_helper'

class PasswordResetsControllerTest < ActionController::TestCase
  include ActionMailer::TestHelper

  setup do
    @user = users :franco
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should send password reset instructions' do
    assert_emails 1 do
      post :create, email: @user.email
    end

    assert_redirected_to root_url
  end

  test 'should get edit' do
    get :edit, id: @user.password_reset_token
    assert_response :success
  end

  test 'should update user password' do
    patch :update, id: @user.password_reset_token, user: {
      password: '123', password_confirmation: '123'
    }

    assert_redirected_to root_url
  end

  test 'should get redirected with expired token' do
    @user.update password_reset_sent_at: 3.hours.ago

    patch :update, id: @user.password_reset_token, user: {
      password: '123', password_confirmation: '123'
    }

    assert_redirected_to new_password_reset_url
  end
end
