class PagesController < ApplicationController

  def root
    @people = Person.all.sort
  end

  def show
    unless @page = Page.find(params[:id], I18n.locale)
      other_locale = I18n.locale.to_s == 'en' ? 'nl' : 'en'
      unless @page = Page.find(params[:id], other_locale)
        # raise ActionController::RoutingError.new("Page '#{ params[:id] }' not found")
        render 'pages/not_found.html'
      else
        flash[:notice] = I18n.t('pages.not_available_in_this_locale')
      end
    end
  end

end
