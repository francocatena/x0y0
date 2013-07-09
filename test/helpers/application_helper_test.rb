require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test 'title' do
    @title = 'test page'

    assert_equal [I18n.t('app_name'), @title].join(' | '), title
  end

  test 'flash message' do
    flash[:notice] = 'test notice'

    assert_equal 'test notice', flash_message

    flash.clear
    flash[:alert] = 'test alert'

    assert_equal 'test alert', flash_message
  end

  test 'flash class' do
    flash[:notice] = 'test notice'

    assert_equal 'alert-info', flash_class

    flash.clear
    flash[:alert] = 'test alert'

    assert_equal 'alert-danger', flash_class
  end

  test 'menu item for' do
    link = link_to User.model_name.human(count: 0), users_path

    assert_equal content_tag(:li, link), menu_item_for(User, users_path)
  end
end
