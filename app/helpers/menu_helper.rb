module MenuHelper
  def menu_item_for model, path
    link = link_to model.model_name.human(count: 0), path
    active = model.model_name.route_key == controller_name

    content_tag(:li, link, (active ? { class: 'active' } : {}))
  end
end
