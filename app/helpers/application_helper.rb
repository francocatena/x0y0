module ApplicationHelper
  def title
    [t('app_name'), @title].compact.join(' | ')
  end
end
