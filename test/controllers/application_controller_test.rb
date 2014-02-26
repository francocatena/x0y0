require 'test_helper'

class ApplicationControllerTest < ActionController::TestCase
  setup do
    @controller.send 'response=', @response
    @controller.send 'request=', @request
  end

  test 'should set title' do
    @controller = UsersController.new
    @controller.action_name = 'create'

    assert_equal I18n.t('users.new.title'), set_title
    assert_not_nil assigns(:title)

    @controller.action_name = 'edit'

    assert_equal I18n.t('users.edit.title'), set_title
  end

  test 'should override action aliases' do
    @controller = UsersController.new
    @controller.action_name = 'test'

    def @controller.action_aliases; super.merge(test: 'alias'); end

    assert_equal I18n.t('users.alias.title'), set_title
  end

  test 'should current user be nil' do
    assert_nil current_user
  end

  test 'should load current user when auth_token is present' do
    login

    assert_not_nil current_user
  end

  test 'should redirect when there is no current user' do
    authorize

    assert_redirected_to login_url
  end

  test 'should not redirect when current user' do
    login
    authorize

    assert_nil @response.location
  end

  test 'should update user' do
    user = users :franco

    update_resource user, { name: 'Updated' }

    assert_equal 'Updated', user.reload.name
  end

  test 'should redirect on update if stale' do
    user = users :franco

    update_resource user, { name: 'Updated', lock_version: user.lock_version.pred }

    assert_not_equal 'Updated', user.reload.name
    assert_redirected_to edit_user_url(user)
  end

  private

    def set_title
      @controller.send :set_title
    end

    def current_user
      @controller.send :current_user
    end

    def authorize
      @controller.send :authorize
    end

    def update_resource *args
      @controller.send :update_resource, *args
    end
end
