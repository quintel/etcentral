class PagesController < ApplicationController

  def show
    @page = Page.load(params[:key], I18n.locale)
  end

end