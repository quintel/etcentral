module ApplicationHelper

  def english?
    I18n.locale == :en
  end

  def information_links
    links = []
    links.push text: I18n.t("header.about_qi") ,           url: 'about'
    links.push text: I18n.t("header.press_releases") ,     url: 'press_releases'
    links.push text: I18n.t("header.privacy_statement") ,  url: 'privacy_statement'
    links.push text: I18n.t("header.disclaimer") ,         url: 'disclaimer'
    links.push text: I18n.t("header.partners") ,           url: 'partners'
    unless APP_CONFIG[:standalone]
      links.push text: I18n.t("header.publications") ,     url: "http://refman.et-model.com", target: "_blank"
    end
    links
  end

end