require 'test_helper'

<% module_namespacing do -%>
class <%= class_name %>Test < ActiveSupport::TestCase
  def setup
    @<%= singular_table_name %> = <%= table_name %> :one
  end

  test 'blank attributes' do
    @<%= singular_table_name %>.attr = ''

    assert @<%= singular_table_name %>.invalid?
    assert_error @<%= singular_table_name %>, :attr, :blank
  end

  test 'unique attributes' do
    <%= singular_table_name %> = @<%= singular_table_name %>.dup

    assert <%= singular_table_name %>.invalid?
    assert_error <%= singular_table_name %>, :attr, :taken
  end
end
<% end -%>
