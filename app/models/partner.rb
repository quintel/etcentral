class Partner < YmlReadOnlyRecord

  attr_accessor :name, :key, :kind

  def self.companies
    self.all.select(&:is_company?)
  end

  def self.institutes
    self.all.select(&:is_institute?)
  end

  def self.governments
    self.all.select(&:is_government?)
  end

  def is_company?
    kind == 'company'
  end

  def is_government?
    kind == 'government'
  end

  def is_institute?
    kind == 'institute'
  end

  def logo
    if File.exists?("./app/assets/images/partners/partners/#{self.key.downcase.gsub(" ","")}.png")
      return "/assets/partners/partners/#{self.key.downcase.gsub(" ","")}.png"
    else
      return 'http://placehold.it/125x40'
    end
  end
end
