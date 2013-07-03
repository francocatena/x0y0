require 'test_helper'

class LinksHelperTest < ActionView::TestCase
  test 'link to destroy' do
    expected = link_to(
      I18n.t('navigation.destroy'),
      '#',
      data: { method: :delete, confirm: I18n.t('messages.confirmation') }
    )

    assert_equal expected, link_to_destroy('#')
  end
end
