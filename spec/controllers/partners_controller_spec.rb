# frozen_string_literal: true

require 'spec_helper'

RSpec.describe PartnersController do
  context 'when sending an invalid Accept' do
    it 'responds with 406 Not Acceptable' do
      get :index, params: { format: :invalid }
      expect(response.code).to eq('406')
    end
  end
end
