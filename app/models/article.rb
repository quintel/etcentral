class Article
  include Sunspot::NakedModel

  attr_reader :lang, :section, :key, :file

  BASE_DIR = "#{ Rails.root }/config/"

  searchable do
    text :key
    text :file do
      content
    end
  end
  
  def initialize(lang, section, key, file)
    @lang    = lang
    @section = section
    @key     = key
    @file    = file
  end

  def section=(section)
    @section = section
  end
  
  def html_content
    renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    renderer.render(content).html_safe
  end

  def article_title
    if result = /<h\d>.+<\/h\d>/.match(html_content)
      result[0].gsub(/<\/?h\d>/,'')
    end
  end

  def first_paragraph
    if result = /<p>.+<\/p>/.match(html_content)
      result[0].gsub(/<\/?p>/,'')
    end
  end

  def self.all
    self.load_directory
  end

  def self.find(key, lang = 'en')
    self.all.select { |p| p.key == key && p.lang == lang }.first
  end
  
  def self.find_similar(article, lang)
    self.all.select { |p| ((/^\d+_/.match(p.section)[0] == /^\d+_/.match(article.section)[0]) && (/^\d+_/.match(p.key)[0] == /^\d+_/.match(article.key)[0]) && (p.lang == lang)) }.first
  end

  #######
  private
  #######

  def content
    File.read(file)
  end

  def self.load_directory
    items = []
    Dir.glob("#{ BASE_DIR }articles/**/*.markdown") do |file|
      path_elements = File.dirname(file).split('/')
      lang = ETM::LocaleController::AVAILABLE_LOCALES.include?(path_elements[-1]) ? path_elements[-1] : path_elements[-2]
      section = ETM::LocaleController::AVAILABLE_LOCALES.include?(path_elements[-1]) ? '' : path_elements[-1]
      key = file.split('/').last.split('.').first
      items << self.new(lang, section, key, file)
    end
    items
  end

end
