class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :locale

  def locale
    # update session if passed
    session[:locale] = params[:locale] if params[:locale]
    # set locale based on session or url
    loc =  session[:locale] || get_locale_from_url
    loc = I18n.default_locale unless ['en', 'nl'].include?(loc.to_s)
    I18n.locale = loc
  end

  def get_locale_from_url
    # set locale based on host or default
    request.host.split(".").last == 'nl' ? 'nl' : I18n.default_locale
  end

end
