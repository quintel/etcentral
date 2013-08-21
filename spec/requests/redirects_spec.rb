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

end
