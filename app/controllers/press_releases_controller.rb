class PressReleasesController < ApplicationController

  def index
    @releases = PressRelease.all.sort_by { |press| press.release_date }.reverse
  end

  def show
    release = PressRelease.find_by_key(params[:id])
    file_url = FOG_BUCKET.files.get(release.file_name)

    if file_url.nil?
      redirect_to press_releases_path
    else
      redirect_to file_url.url(Time.now + 20.minutes) unless file_url.nil?
    end
  end

end
