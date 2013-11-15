module ApplicationHelper

  def is_production?
    !is_beta?
  end

  def is_beta?
    request.host_with_port =~ /beta/
  end

  def currently_at(item)
    render_partial 'navbar', locals: { current_item: item }
  end

  def menu_items
    YAML.load_file(File.join(Rails.root,'config','menu.yml'))
  end

end

