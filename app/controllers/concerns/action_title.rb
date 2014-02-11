module ActionTitle
  extend ActiveSupport::Concern

  def set_title
    @title = t action_title
  end

  private

    def action_title
      alias_action = 'new'  if action_name == 'create'
      alias_action = 'edit' if action_name == 'update'

      [controller_name, alias_action || action_name, 'title'].join '.'
    end
end
