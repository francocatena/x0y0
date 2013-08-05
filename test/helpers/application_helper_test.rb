require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test 'title' do
    @title = 'test page'

    assert_equal [I18n.t('app_name'), @title].join(' | '), title
  end

  test 'input default' do
    assert_kind_of Hash, input_defaults
  end
end
