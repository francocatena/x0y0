require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  setup do
    login
  end

  test 'should get edit' do
    get :edit
    assert_response :success
  end

  test 'should get update' do
    patch :update, user: { name: 'Updated name' }
    assert_redirected_to root_url
  end
end
