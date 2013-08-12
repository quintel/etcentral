class Person
  attr_accessor :name, :title, :key, :status, :social, :education, :experience, :questions, :has_image, :prefix
  
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
    self.all.select{|p|p.key == key}.first
  end
  
  def first_name
    name.split(" ").first
  end

  def name_with_titles
    "#{prefix} #{name}"
  end

  def image_path(type)
    "people/#{key}/#{type}.jpg"
  end

  def <=>(other_person)
    self.name <=> other_person.name
  end
  
  # Public: returns a string containing the path or false when the image has
  # not been found
  def has_image?(type)
    path = "#{Rails.root}/app/assets/images/people/#{key}/#{type.to_s}.jpg"
    FileTest.exist?(path) ? path : false
  end

  #######
  private
  #######

  def self.load_directory
    items = []
    Dir.glob("#{Rails.root}/config/#{yml_store}/*.yml") do |yml_file|
      items << self.new( YAML.load_file yml_file )
    end
    items.delete_if { |item| item.status.downcase != "active" }
    items
  end

end
