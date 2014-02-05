class PresetsController < ApplicationController

  DASHBOARD_QUERIES = %w{
    dashboard_energy_demand_primary_of_final_plus_export_losses
    dashboard_reduction_of_co2_emissions_versus_1990
    dashboard_energy_import_netto
    dashboard_total_costs
    dashboard_bio_footprint
    dashboard_renewability
  }

  def index
    @presets = fetch_presets
  end

  def event
    @presets = fetch_presets.select { |p| p.event == params[:id] }
  end

  def show
    @preset = Preset.find(params[:id])

    unless @preset
      render 'pages/not_found'
    else
      response = preset_data(@preset)

      if response['scenario']
        @description = description_for_locale(response)

        demand = response['gqueries']['dashboard_energy_demand_primary_of_final_plus_export_losses']
        energy_use = (demand['future']/demand['present']) - 1
        response['gqueries'].each_pair { |gquery, values| @values ||= []; @values << [values['future'], values['unit']] }
        @values = @values.values_at(1..-1).insert(0, [energy_use, 'factor'])
        panels = [
          "energy_use",
          "co2_emissions",
          'energy_imports',
          'costs',
          "bio_footprint",
          "renewables"
        ]
        panels.each_with_index { |panel,index| @values[index] = [panel,@values[index]] }
      else
        @description = "Oops, something went wrong..."
      end
    end
  end

  #######
  private
  #######

  def server_url
    is_beta? ? 'http://beta.et-engine.com' : 'http://et-engine.com'
  end

  def fetch_presets
    Preset.all.select(&:has_scenario?).shuffle
  end

  def preset_data(preset)
    url = "#{ server_url }/api/v3/scenarios/#{ preset.scenario_id }/dashboard"
    HTTParty.put(url, body: {}, query: { gqueries: DASHBOARD_QUERIES, detailed: true })
  end

  def description_for_locale(response)
    html = Nokogiri::HTML.parse(response['scenario']['description'])
    html.css(".#{locale}").inner_html
  end
end
