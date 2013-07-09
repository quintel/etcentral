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

    it 'shows' do
      get preset_path(:camp)
      expect(response).to be_success
      expect(response.body).to match /frans van camp/i
    end

  end

end
