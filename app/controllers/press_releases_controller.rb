class PressReleasesController < ApplicationController

  def index
    @press_releases = PressRelease.all.sort { |x,y| y.release_date <=> x.release_date }
  end

end