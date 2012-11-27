class PagesController < ApplicationController

  def show
    @page = Page.load(params[:key],session[:locale])
  end

  def press_releases
    @releases = PressRelease.all.sort_by { |press| press.release_date }.reverse
  end

  def press_release
    @release = PressRelease.find_by_id(params[:id])
    redirect_to root_path if @release.nil?
  end

  def partners
    @all_partners = Partner.all.uniq.sort_by{Kernel.rand}
    @partner_types = ['general']
    @partner_types << 'knowledge' if @all_partners.map(&:partner_type).include?('knowledge')
    @partner_types << 'education' if @all_partners.map(&:partner_type).include?('education')
    @active_partner_type = params[:partner_type] || 'general'
    @partners = @all_partners.select{|p|p.partner_type == @active_partner_type}
  end

end