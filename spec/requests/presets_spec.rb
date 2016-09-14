require 'spec_helper'

describe 'presets' do
  describe 'all presets' do
    it 'shows' do
      get presets_path

      expect(response).to be_success
    end

    it 'displays frans and dennis' do
      get presets_path

      expect(response.body).to match /frans van camp/i
      expect(response.body).to match /dennis schoenmakers/i
    end
  end

  describe 'one preset' do
    before do
      stub_request(:put, "https://engine.energytransitionmodel.com/api/v3/scenarios/1/dashboard?detailed=true&gqueries%5B0%5D=dashboard_energy_demand_primary_of_final_plus_export_losses&gqueries%5B1%5D=dashboard_reduction_of_co2_emissions_versus_1990&gqueries%5B2%5D=dashboard_energy_import_netto&gqueries%5B3%5D=dashboard_total_costs&gqueries%5B4%5D=dashboard_bio_footprint&gqueries%5B5%5D=dashboard_renewability")
        .to_return(:status => 200, :body => "", :headers => {})
    end

    it 'shows' do
      get preset_path(:camp)

      expect(response).to be_success
      expect(response.body).to match /frans van camp/i
    end
  end
end
