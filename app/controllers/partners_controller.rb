class PartnersController < ApplicationController

  def index
    @current_type = params[:type] || Partner::TYPES.first
    @partners = Partner.all(@current_type)
  end

end
