class PagesController < ApplicationController

  def show
    @page = Page.load(params[:key],session[:locale])
  end

end