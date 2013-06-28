class Page

  attr_reader :key, :lang, :path

  def initialize(key, lang)
    @key  = key
    @lang = lang
  end

  def html_content
    renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    renderer.render(content).html_safe
  end

  #######
  private
  #######

  def content
    File.read(self.class.path(key, lang))
  end

  #----- Class methods -----------------------

  class << self

    def find(key, lang)
      new(key, lang) if exists?(key, lang)
    end

    def exists?(key, lang)
      File.exists?(path(key, lang))
    end

    def path(key, lang)
      "#{ Rails.root }/config/pages/#{ lang }/#{ key }.markdown"
    end

  end

end
