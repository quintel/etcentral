require 'spec_helper'

describe "prominent users" do
  
  before(:each) do
    get '/prominent_users'
  end
  
  context "when prominent user exists" do
    
    it "should have a photo" do
      expect(response).to be_success
      expect(response.body).to match /jelles.*/
    end
    
    it "should have a link to the associated scenario" do
      expect(response.body).to match /scenarios\/132824/
    end

  end

  context "when some associated data is missing" do

    it "should display placeholder when photo is missing" do
      pending("To be implemented")
    end

    it "should link to same page when id is missing" do
      expect(response.body).to match /#/
    end

  end

end