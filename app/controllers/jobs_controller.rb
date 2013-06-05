class JobsController < ApplicationController

  def show
    if lookup_context.exists?("jobs/#{params[:id]}")
      render params[:id]
    else
      render 'pages/not_found'
    end
  end

end
