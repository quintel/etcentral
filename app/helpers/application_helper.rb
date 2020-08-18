# frozen_string_literal: true

module ApplicationHelper
  def currently_at(item)
    render_partial 'navbar', locals: { current_item: item }
  end

  def menu_items
    YAML.load_file(File.join(Rails.root,'config','menu.yml'))
  end

  # Converts a link (from menu.yml) to an href for use in a template.
  def navbar_link(url)
    if url.start_with?('product:')
      product_link(url[8..-1].to_sym)
    elsif url.start_with?('https://', 'http://')
      url
    else
      "/#{url.sub(%r{^/}, '')}"
    end
  end

  def navbar_link_options(url)
    if url.start_with?('https://', 'http://')
      { class: 'dropdown-item', target: '_blank', rel: 'noreferrer noopener' }
    else
      { class: 'dropdown-item' }
    end
  end

  def s3(path)
    S3Helper.url(path)
  end
end
