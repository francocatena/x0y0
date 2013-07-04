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

  test 'link to actions' do
    assert_equal link_to(t('navigation.edit'), '#'), link_to_edit('#')
    assert_equal link_to(t('navigation.index'), '#'), link_to_index('#')
    assert_equal link_to(t('navigation.show'), '#'), link_to_show('#')
    assert_equal link_to(t('.show'), '#'), link_to_new('#')
  end
end
