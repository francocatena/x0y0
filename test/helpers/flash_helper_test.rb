require 'test_helper'

class FlashHelperTest < ActionView::TestCase
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
end
