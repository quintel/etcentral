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
        link = "https://light.energytransitionmodel.com"
      when :pro
        link = "https://pro.energytransitionmodel.com"
      when :etmoses
        link = "https://moses.energytransitionmodel.com"
      end

      link += "?locale=#{I18n.locale}"
    end

    if is_beta?
      case product
      when :etmoses
        link = 'https://beta-moses.energytransitionmodel.com'
      end
    end

    link
  end

  def has_beta?(product)
    return false unless is_beta?

    case product
    when :light   then true
    when :etmoses then true
    when :pro     then true
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
