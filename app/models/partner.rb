class Partner < YmlReadOnlyRecord

  attr_accessor :name, :key, :kind, :lang, :path

  # Return a partner page that contains the contents bla-di-bla
  def partner_page
    PartnerPage.find(key, :nl)
  end

  def self.primary
    self.all.select(&:is_primary?)
  end

  def self.knowledge
    self.all.select(&:is_knowledge?)
  end

  def self.education
    self.all.select(&:is_education?)
  end

  def is_primary?
    kind == 'primary'
  end

  def is_knowledge?
    kind == 'knowledge'
  end

  def is_education?
    kind == 'education'
  end

  def logo
    "http://#{ BUCKET_NAME }.s3.amazonaws.com/partners/#{ self.key.downcase.gsub(" ","") }.png"
  end

  def html_content(lang)
    renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    renderer.render(content(lang)).html_safe
  end

  def content(lang)
    File.read(self.class.path(key, lang))
  end

  def self.path(key, lang)
    "#{ Rails.root }/config/partners/#{ lang }/#{ key }.markdown"
  end
end
