class Page

  attr_accessor :key, :locale

  def initialize(key, locale)
    @key    = key
    @locale = locale
  end

  def html
    File.open("#{Rails.root}/db/static_pages/#{key}.#{locale}.html", 'r').read
  end

  # Public Class methdod
  # Returns instance of Page
  def self.load(key, locale)
    Page.new(key, locale)
  end
end