class PartnersController < ApplicationController

  def index
    @partners = Partner.all
  end

  def show
    @partner = Partner.find(params[:id])
    unless @partner
      render 'pages/not_found'
    end
  end

end
