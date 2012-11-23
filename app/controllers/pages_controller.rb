class PagesController < ApplicationController

  def show
    file_path = \
      "#{Rails.root}/db/static_pages/#{params[:key]}.#{session[:locale]}.html"
    @content = File.open(file_path, 'r').read
  end

end