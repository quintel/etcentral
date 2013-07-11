require 'spec_helper'

describe PressReleasesController do
  
  describe 'GET index' do

    let(:press_release_1) { PressRelease.find(1) }
    let(:press_release_2) { PressRelease.find(2) }

    before { get :index }

    it 'has two items' do
      expect(assigns(:press_releases)).to have(2).items
    end

  end

  describe 'GET show' do

    before { get :show, id: 1 }

    it 'contains an article' do
      expect(assigns(:press_release)).to_not be_nil
    end

  end

end
  