class YmlReadOnlyRecord

  BASE_DIR = "#{ Rails.root }/config/"

  def initialize(attr_hash)
    attr_hash.symbolize_keys!
    attr_hash.each do |key, value|
      self.send("#{ key }=", value)
    end
  end

  def self.all
    self.load_collective_file || self.load_directory
  end

  def self.yml_store
    self.name.downcase.pluralize
  end

  def self.find(key)
    self.all.select { |p| p.key == key }.first
  end

  #######
  private
  #######

  def self.load_collective_file
    file = "#{ BASE_DIR }#{ yml_store }.yml"
    return false unless File.exist?(file)
    YAML.load_file(file).map { |i| self.new i }
  end

  def self.load_directory
    items = []
    Dir.glob("#{ BASE_DIR }#{ yml_store }/**/*.yml") do |yml_file|
      items << self.new(YAML.load_file yml_file)
    end
    items
  end

end
