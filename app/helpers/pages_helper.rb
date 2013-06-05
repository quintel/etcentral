module PagesHelper

  def product_link(product)
    case product
    when :etflex
      make_link("light.energytransitionmodel.com")
    when :pro
      make_link("pro.energytransitionmodel.com")
    when :mixer
      make_link('mixer.energytransitionmodel.com')
    end
  end

  def make_link(link)
    "http://#{ link }"
  end

end
