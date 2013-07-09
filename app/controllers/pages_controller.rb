class PagesController < ApplicationController

  def show
    unless @page = Page.find(params[:id], I18n.locale)
      raise ActionController::RoutingError.new("Page '#{ params[:id] }' not found")
    end
  end

  def prominent_users
    @users = YAML::load_file('config/prominent_users.yml').sort_by{rand()}
  end
  
  def press_releases
    @releases = PressRelease.all.sort { |x,y| y.release_date <=> x.release_date }
  end
  
end
