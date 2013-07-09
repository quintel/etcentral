class PagesController < ApplicationController

  def show
    unless @page = Page.find(params[:id], I18n.locale)
      raise ActionController::RoutingError.new("Page '#{ params[:id] }' not found")
    end
  end

  def press_releases
    @releases = PressRelease.all.sort { |x,y| y.release_date <=> x.release_date }
  end

end
