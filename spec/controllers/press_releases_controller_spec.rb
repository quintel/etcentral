require 'spec_helper'

describe PressReleasesController do

  describe 'GET index' do

    before { get :index }

    it 'has two items' do
      expect(assigns(:press_releases).length).to eq(2)
    end

  end

end
