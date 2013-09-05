class PartnersController < ApplicationController
  respond_to  :html, :json, only: [:index]

  def index
    @partners = Partner.all
    respond_with(@partners)
  end

  def show
    @partner = Partner.find(params[:id])
    unless @partner
      render 'pages/not_found'
    end
  end

end
