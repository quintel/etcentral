module ApplicationHelper

  def english?
    I18n.locale == :en
  end

  def information_links
    links = []
    links.push text: t("header.about_qi") ,           url: 'about'
    links.push text: t("header.press_releases") ,     url: 'press_releases'
    links.push text: t("header.privacy_statement") ,  url: 'privacy_statement'
    links.push text: t("header.disclaimer") ,         url: 'disclaimer'
    unless APP_CONFIG[:standalone]
      links.push text: t("header.publications") ,     url: "http://refman.et-model.com", target: "_blank"
    end
  end

end
