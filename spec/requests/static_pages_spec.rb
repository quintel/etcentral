require 'spec_helper'

describe "StaticPages" do
  it "displays the index page" do
    get "/"
    expect(response).to be_success
  end

  describe "Index page" do
    before(:each) do
      subject { page }
      visit root_path
    end

    %w[Light Professional Mixer].each do |version|
      it "contains a reference to #{version}" do
        expect(page).to have_content(version)
      end
    end

    it "contains an information menu " do
      expect(page).to have_content('Disclaimer')
      expect(page).to have_content('About Quintel')
      expect(page).to have_content('Press releases')
      expect(page).to have_content('Privacy statement')
    end
  end

  it "displays Disclaimer page" do
    visit root_path
    click_link 'Disclaimer'
    expect(page).to have_selector('h1', text: 'Disclaimer')
  end

  it "displays About page" do
    visit root_path
    click_link 'About Quintel Intelligence'
    expect(page).to have_selector('h1', text: 'About Quintel Intelligence')
  end

  xit "displays Press releases page" do
    visit root_path
    click_link 'Press releases'
    expect(page).to have_selector('h1', text: 'Press releases about the Energy Transition Model')
  end

  xit "displays Publications page" do
    visit root_path
    save_and_open_page
    expect(page).to have_link('Publications', href: 'http://refman.et-model.com/')
  end

end
