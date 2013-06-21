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

end
