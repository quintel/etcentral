class YmlReadOnlyRecord

  def initialize(attr_hash)
    attr_hash.symbolize_keys!
    attr_hash.each do |key,value|
      self.send("#{key}=", value)
    end
  end

  def self.all
     self.load_directory
  end

  def self.yml_store
    self.name.downcase.pluralize
  end

  def self.find(key)
    self.all.select{|p|p.title =~ /#{key}/}.first
  end

  #######
  private
  #######

  def self.load_directory
    items = []
    Dir.glob("#{Rails.root}/config/#{yml_store}/*.yml") do |yml_file|
      items << self.new( YAML.load_file yml_file ) unless yml_file.nil?
    end
    items
  end

end
