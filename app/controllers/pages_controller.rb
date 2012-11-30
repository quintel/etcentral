class PagesController < ApplicationController

  def show
    @page = Page.load(params[:key],session[:locale])
  end

  def press_releases
    @releases = PressRelease.all.sort_by { |press| press.release_date }.reverse
  end

  def press_release
    release = PressRelease.find_by_id(params[:id])
    file_url = FOG_BUCKET.files.get(release.file_name)
    if file_url.nil?
      redirect_to press_releases_path
    else
      redirect_to file_url.url(Time.now + 20.minutes) unless file_url.nil?
    end
  end

end