require 'spec_helper'

describe PresetsController do

  describe 'GET index' do

    let(:frans)  { Preset.find(:camp) }
    let(:dennis) { Preset.find(:schoenmakers) }

    before { get :index }

    it 'has two items' do
      expect(assigns(:presets)).to have(2).items
    end

    it 'contains Frans and Dennis' do
      presets = assigns(:presets).map(&:name)
      expect(presets).to include "Frans van Camp"
      expect(presets).to include "Dennis Schoenmakers"
    end

  end

  describe 'GET show' do

    before { get :show, id: :camp }

    it 'contains Frans' do
      expect(assigns(:preset)).to_not be_nil
    end

  end

end
