module ApplicationHelper
  def english?
    I18n.locale == :en
  end

  def information_links
    locale = "?locale=#{session[:locale]}"
    links = []
    links.push text: t("header.about_qi") ,           url: 'about' + locale
    links.push text: t("header.press_releases") ,     url: 'press_releases' + locale
    links.push text: t("header.privacy_statement") ,  url: 'privacy_statement' + locale
    links.push text: t("header.disclaimer") ,         url: 'disclaimer' + locale
    unless APP_CONFIG[:standalone]
      links.push text: t("header.publications") ,     url: "http://refman.et-model.com", target: "_blank"
    end
    links.sort! {|x,y| x[:text] <=> y[:text] }
  end

end
