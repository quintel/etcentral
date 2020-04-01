# frozen_string_literal: true

module PagesHelper
  def product_link(product)
    "https://#{beta_prefix(product)}#{product}.energytransitionmodel.com"
  end

  def beta_prefix(product)
    if Rails.env.staging? && product_has_beta?(product)
      product == :light ? 'beta.' : 'beta-'
    else
      ''
    end
  end

  def product_has_beta?(product)
    return false unless Rails.env.staging?

    case product
    when :light, :pro then true
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
