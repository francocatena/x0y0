require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:john)

    login
  end

  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create user' do
    assert_difference 'User.count' do
      post :create, params: {
        user: {
          name: @user.name,
          lastname: @user.lastname,
          email: 'new@user.com',
          password: '123',
          password_confirmation: '123'
        }
      }
    end

    assert_redirected_to user_url(User.last)
  end

  test 'should show user' do
    get :show, params: { id: @user }
    assert_response :success
  end

  test 'should get edit' do
    get :edit, params: { id: @user }
    assert_response :success
  end

  test 'should update user' do
		patch :update, params: {
			id: @user,
			user: { name: 'Updated name' }
		}
    assert_redirected_to user_url(@user)
  end

  test 'should destroy user' do
    assert_difference('User.count', -1) do
      delete :destroy, params: { id: @user }
    end

    assert_redirected_to users_url
  end
end
