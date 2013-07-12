require 'spec_helper'

describe PressReleasesController do
  
  describe 'GET index' do

    before { get :index }

    it 'has two items' do
      expect(assigns(:press_releases)).to have(2).items
    end

  end

end
  