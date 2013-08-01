module ArticlesHelper

  def proper_capitalization(text)
    text[0].capitalize + text[1..text.length]
  end

end