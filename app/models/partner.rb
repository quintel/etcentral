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

  def self.get_all
    all.uniq.sort_by { Kernel.rand }
  end

  def self.get_types
    types = ['general']
    types << 'knowledge' if get_all.map(&:type).include?('knowledge')
    types << 'education' if get_all.map(&:type).include?('education')
  end

  def self.select_partners(active_partner_type)
    get_all.select { |p| p.type == active_partner_type }
  end

end
