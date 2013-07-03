module LinksHelper
  def link_to_destroy(*args)
    options = args.extract_options!

    options[:data]           ||= {}
    options[:data][:method]  ||= :delete
    options[:data][:confirm] ||= t('messages.confirmation')

    link_to t('navigation.destroy'), *args, options
  end

  def link_to_edit(*args)
    link_to t('navigation.edit'), *args
  end

  def link_to_index(*args)
    link_to t('navigation.index'), *args
  end

  def link_to_new(*args)
    link_to t('.new'), *args
  end

  def link_to_show(*args)
    link_to t('navigation.show'), *args
  end
end
