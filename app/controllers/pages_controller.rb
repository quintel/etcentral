class PagesController < ApplicationController

  def show
    @page = Page.load(params[:key],session[:locale])
  end

  def press_releases
    @releases = PressRelease.all.sort_by { |press| press.release_date }.reverse
  end

end