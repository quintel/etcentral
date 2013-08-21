module PagesHelper

  def product_link(product)
    link = "http://"
    link += is_beta? ? 'beta.' : ''
    link += product.to_s
    link += dutch? ? '.energietransitiemodel.nl' : '.energytransitionmodel.com'
  end

  def is_beta?
    request.host_with_port =~ /beta/
  end

  def dutch?
    I18n.locale == :nl
  end

  def english?
    I18n.locale == :en
  end
end
