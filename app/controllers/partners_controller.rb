class PartnersController < ApplicationController
  def index
    @partners = Partner.all

    respond_to do |format|
      format.html
      format.json { render json: @partners }
    end
  end

  def show
    @partner = Partner.find(params[:id])
    unless @partner
      render 'pages/not_found'
    end
  end

end
