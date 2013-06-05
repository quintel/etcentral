require 'spec_helper'

describe "Jobs page" do
  describe "index page" do
    it "should display all Jobs" do
      get jobs_path
      response.body.should include("Ruby developer")
      response.body.should include("modeler")
    end
    context "when job does exist" do
      it "when clicking a job should provide individual page" do
        visit jobs_path
        click_link "Ruby developer"
        page.should have_content("Ruby")
      end
    end
    context "when job does not exist" do
      it "when clicking a job should render page not found" do
        get "/jobs/ceo_of_microsoft"
        expect(response).to render_template('pages/not_found')
        #expect(page).to have_content("page not found")
      end
    end
  end
end
