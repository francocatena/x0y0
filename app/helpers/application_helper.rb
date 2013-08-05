module ApplicationHelper
  def title
    [t('app_name'), @title].compact.join(' | ')
  end

  def input_defaults
    { input_html: { class: 'form-control' } }
  end
end
