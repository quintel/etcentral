module ApplicationHelper

  def currently_at(item)
    render_partial 'navbar', locals: { current_item: item }
  end

  def menu_items
    YAML.load_file(File.join(Rails.root,'config','menu.yml'))
  end

end

