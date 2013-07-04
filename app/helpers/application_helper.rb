module ApplicationHelper
  def title
    [t('app_name'), @title].compact.join(' | ')
  end

  def flash_message
    flash[:alert] || flash[:notice]
  end

  def flash_class
    flash[:alert] ? 'alert-danger' : 'alert-info'
  end
end
