class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale

  #######
  private
  #######

  def set_locale
    I18n.locale = get_locale_from_url || I18n.default_locale
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

end