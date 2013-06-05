class Post < YmlReadOnlyRecord

  attr_accessor :date, :author, :key, :title, :language

  def content
    File.read("#{Rails.root}/config/blog/#{key}.markdown")
  end

  def html_content
    Redcarpet::Markdown.new(Redcarpet::Render::HTML).render(content).html_safe
  end

  def <=>(other_post)
    other_post.date <=> self.date
  end

  def person
    Person.find(author)
  end

  def formatted_date(type = :long)
    case type
    when :long
      date.strftime("%B %-d, %Y")
    when :short
      date.strftime("%-d %b %y")
    else
      raise ArgumentError, "Don't know #{type}"
    end
  end

end
