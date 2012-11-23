class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale

  #######
  private
  #######

  def set_locale
    session[:locale] = get_locale_from_url || I18n.default_locale
    I18n.locale =  session[:locale]
  end

  # Private: returns Symbol locale from url hostname, or nil when it
  # cannot be determined from the url hostname
  def get_locale_from_url
    if request.host.match 'energie'
      :nl
    elsif request.host.match 'energy'
      :en
    else
      nil
    end
  end

  def default_url_options(options=())
    logger.debug " default_url_options is passed options: #{options.inspect}\n"
    { locale: I18n.locale }
  end

end