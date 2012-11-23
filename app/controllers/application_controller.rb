class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale

  private

    def set_locale
      session[:locale] = params[:locale] || I18n.default_locale
      I18n.locale =  session[:locale]
    end

    def default_url_options(options=())
      logger.debug " default_url_options is passed options: #{options.inspect}\n"
      { locale: I18n.locale }
    end


end
