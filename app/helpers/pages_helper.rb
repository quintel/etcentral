module PagesHelper

  def product_link(product)
    case product
    when :etflex
      make_link("light.#{lang_link}")
    when :pro
      make_link("#{lang_link}/pro")
    when :mixer
      make_link('mixer.et-model.com')
    end
  end

  def make_link(link)
    "http://#{link}"
  end

end