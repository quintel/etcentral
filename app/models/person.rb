class Person < YmlReadOnlyRecord
  attr_accessor :name, :title, :key, :has_image, :prefix

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

  def education
    details["education"]
  end

  def questions
    details["questions"]
  end

  def social
    details["social"]
  end

  def experience
    details["experience"]
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

  def details
    YAML.load_file("#{Rails.root}/config/people/#{self.key}.yml") rescue {}
  end

end
