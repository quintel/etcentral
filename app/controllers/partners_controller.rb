class PartnersController < ApplicationController

  def index
    @types = Partner.get_types
    @active_partner_type = params[:type] || 'general'
    @partners = Partner.select_partners(@active_partner_type)
  end

end
