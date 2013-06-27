class Partner < YmlReadOnlyRecord

  attr_accessor :name, :key, :kind

  # Return a partner page that contains the contents bla-di-bla
  def partner_page
    PartnerPage.find(key, :nl)
  end

  def self.primary
    self.all.select(&:is_primary?)
  end

  def self.knowledge
    self.all.select(&:is_knowledge?)
  end

  def self.education
    self.all.select(&:is_education?)
  end

  def is_primary?
    kind == 'primary'
  end

  def is_knowledge?
    kind == 'knowledge'
  end

  def is_education?
    kind == 'education'
  end

  def logo
    if File.exists?("./app/assets/images/partners/partners/#{self.key.downcase.gsub(" ","")}.png")
      return "/assets/partners/partners/#{self.key.downcase.gsub(" ","")}.png"
    else
      return 'http://placehold.it/125x40'
    end
  end
end
