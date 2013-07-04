require 'test_helper'

class LinksHelperTest < ActionView::TestCase
  test 'link to destroy' do
    expected = link_to(
      t('navigation.destroy'), '#',
      data: { method: :delete, confirm: t('messages.confirmation') }
    )

    assert_equal expected, link_to_destroy('#')
  end

  test 'link to actions' do
    assert_equal link_to(t('navigation.edit'), '#'), link_to_edit('#')
    assert_equal link_to(t('navigation.index'), '#'), link_to_index('#')
    assert_equal link_to(t('navigation.show'), '#'), link_to_show('#')
  end
end
