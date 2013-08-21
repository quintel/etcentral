module PagesHelper

  def product_link(product)
    link = "http://"
    link += has_beta?(product) ? 'beta.' : ''
    link += product.to_s
    link += dutch? ? '.energietransitiemodel.nl' : '.energytransitionmodel.com'
  end

  def is_beta?
    request.host_with_port =~ /beta/
  end

  def has_beta?(product)
    return false unless is_beta?

    case product
    when :light then true
    when :pro   then true
    else false
    end
  end

  def dutch?
    I18n.locale == :nl
  end

  def english?
    I18n.locale == :en
  end
end
