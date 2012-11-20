class PagesController < ApplicationController
  layout 'static_page', only: [:about, :disclaimer, :privacy_statement]
  
  def index
  end

  public

    def press_releases
      @releases = PressRelease.order("release_date desc")
    end

end
