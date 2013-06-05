require 'spec_helper'

describe "Team page" do
  describe "index page" do
    it "should display all Quintellers" do
      get team_path
      response.body.should include("Alexander")
      response.body.should include("Dennis")
      response.body.should include("Chael")
    end
    it "when clicking a person should provide individual page" do
      visit team_path
      click_link "Dennis Schoenmakers"
      page.should have_content("Economics")
    end
  end
end
