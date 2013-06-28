class PagesController < ApplicationController

  def show
    unless @page = Page.find(params[:id], session[:locale])
      raise ActionController::RoutingError.new("Page '#{ params[:id] }' not found")
    end

  end

end
