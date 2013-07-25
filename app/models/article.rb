module Sunspot
  module NakedModel
    def self.included(base)
      base.class_eval do
        include Sunspot::Rails::Searchable
        # extend Sunspot::Rails::Searchable::ActsAsMethods
        Sunspot::Adapters::DataAccessor.register(DataAccessor, base)
        Sunspot::Adapters::InstanceAdapter.register(InstanceAdapter, base)
        
        def self.logger; ::Rails.logger; end
        def self.before_save(callback); end
        def self.after_save(callback); end
        def self.after_destroy; end
        def self.find_in_batches(opts={})
          yield all
        end
        
      end
    end
    
    class InstanceAdapter < Sunspot::Adapters::InstanceAdapter
      def id
        "#{@instance.key}:#{@instance.lang}"
      end
    end

    class DataAccessor < Sunspot::Adapters::DataAccessor
      def load(id)
        key, lang = id.split(':')
        @clazz.find(key, lang)
      end

      def load_all(ids)
        ids.map { |id| load(id) }
      end
    end  
  end
  
end

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

  def html_content
    renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    renderer.render(content).html_safe
  end

  def article_title
    if result = /<h\d>.+<\/h\d>/.match(html_content)
      return result[0].gsub(/<\/?h\d>/,'')
    end
  end

  def first_paragraph
    if result = /<p>.+<\/p>/.match(html_content)
      return result[0].gsub(/<\/?p>/,'')
    end
  end

  def self.all
    self.load_directory
  end

  def self.find(key, lang = 'en')
    self.all.select { |p| p.key == key && p.lang == lang }.first
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
