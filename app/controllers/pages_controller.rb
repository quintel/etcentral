class PagesController < ApplicationController
  def index
  end

  public

    def press_releases
      @releases = PressRelease.order("release_date desc")
    end
    
end
