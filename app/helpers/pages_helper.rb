module PagesHelper

  def product_link(product)
    link = "http://"
    link += has_beta?(product) ? 'beta.' : ''
    link += product.to_s
    link += dutch? ? '.energietransitiemodel.nl' : '.energytransitionmodel.com'

    # Untill we fix the DNS records for real and let it propogate...
    if is_production?
      case product
      when :light
        link = "http://etflex.et-model.com"
      when :pro
        link = "http://pro.et-model.com"
      when :mixer
        link = "http://mixer.et-model.com"
      end

      link += "?locale=#{I18n.locale}"
    end

    link
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
