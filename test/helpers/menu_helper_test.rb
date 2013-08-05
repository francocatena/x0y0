require 'test_helper'

class MenuHelperTest < ActionView::TestCase
  test 'menu item for' do
    link = link_to User.model_name.human(count: 0), users_path

    assert_equal content_tag(:li, link), menu_item_for(User, users_path)
  end
end
