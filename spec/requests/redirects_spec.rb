require 'spec_helper'

describe 'redirects' do

  paths = { '/scenarios/80'    => '/scenarios/80',
            '/scenarios/new'   => '/scenarios/new',
            '/pro'             => '',
            '/login'           => '/login',
            '/scenario/demand' => '/scenario/demand',
            '/scenario'        => '/scenario' }

  paths.each do |key, value|

    it "redirects #{ key } properly " do

      get key
      expect(response).to redirect_to "http://pro.#{ request.host }#{ value }"
      expect(response.status).to eq 301

    end

  end

  describe 'RLI scenarios' do
    context 'RLI ser-scenario-2023' do
      it 'redirects to beta ETM ser scenario 2023' do
        get '/rli/ser-scenario-2023'
        expect(response).to redirect_to "http://pro.et-model.com/scenarios/193349"
      end
    end
    context 'RLI 80% CO2 reductie' do
      it 'redirects to beta ETM 80% CO2 reductie scenario' do
        get '/rli/80-procent-co2-reductiescenario-2050'
        expect(response).to redirect_to "http://pro.et-model.com/scenarios/423879"
      end
    end
    context 'RLI 95% CO2 reductie' do
      it 'redirects to beta ETM 95% CO2 reductie scenario' do
        get '/rli/95-procent-co2-reductiescenario-2050'
        expect(response).to redirect_to "http://pro.et-model.com/scenarios/423882"
      end
    end
  end
end
