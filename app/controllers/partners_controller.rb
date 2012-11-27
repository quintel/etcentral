class PartnersController < ApplicationController
  def show
    @partner = Partner.find_by_slug(params[:name])
    raise ActiveRecord::RecordNotFound if @partner.nil?
  end

  def index
    @all_partners = Partner.all.uniq.sort_by { Kernel.rand }
    @partner_types = ['general']
    @partner_types << 'knowledge' if @all_partners.map(&:partner_type).include?('knowledge')
    @partner_types << 'education' if @all_partners.map(&:partner_type).include?('education')
    @active_partner_type = params[:partner_type] || 'general'
    @partners = @all_partners.select { |p| p.partner_type == @active_partner_type }
  end
end
