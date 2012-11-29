class Partner < YmlReadOnlyRecord
  attr_accessor :key, :name, :url, :country, :type,
                :description_en, :description_nl

  def key_or_name
    name ? name : key
  end

  def logo
    "/assets/partners/#{key}.png"
  end

  def description
    I18n.locale == :nl ? description_nl : description_en
  end

end
