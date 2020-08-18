class Partner < YmlReadOnlyRecord

  attr_accessor :name, :key, :kind, :lang, :path

  def self.primary
    self.all.select(&:is_primary?).sort_by { |p| p.name.downcase }
  end

  def self.knowledge
    self.all.select(&:is_knowledge?).sort_by { |p| p.name.downcase }
  end

  def self.education
    self.all.select(&:is_education?).sort_by { |p| p.name.downcase }
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
    S3Helper.url("partners/#{ key.downcase.gsub(" ","") }.png")
  end

  def inner_logo
    logo.gsub(/\.png$/, "-inner.png")
  end

  def html_content(lang)
    renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    renderer.render(content(lang)).html_safe
  end

  def content(lang)
    File.read(self.class.path(key, lang))
  end

  def as_json(*)
    json = Hash.new

    json[:name] = name
    json[:key]  = key
    json[:kind] = kind
    json[:img]  = inner_logo

    json
  end

  def self.path(key, lang)
    "#{ Rails.root }/config/partners/#{ lang }/#{ key }.markdown"
  end
end
