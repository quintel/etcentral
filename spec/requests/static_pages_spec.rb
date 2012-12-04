require 'spec_helper'

menu_items = %w[Disclaimer About\ Quintel Press\ releases Privacy\ statement Partners]

describe Page do
  it "displays the index page" do
    get press_releases_path
    expect(response).to be_success
  end

  describe "Index page" do
    before(:each) do
      visit root_path
    end

    %w[Light Professional Mixer].each do |version|
      it "contains a reference to #{version}" do
        expect(page).to have_content(version)
      end
    end

    describe "Information menu " do

      before(:each) do
        click_link 'Information'
      end

      it "shows the information menu when you click on it", js: true do
        expect(page.find('#information_menu')['style']).to eq("display: block; ")
      end

      menu_items.each do |item|
        it "contains a link to the #{item} page", js: true do
          expect(page).to have_link(item)
        end
      end

      context "user clicks some link in the information menu" do
        menu_items.each do |item|
          it "User clicked #{item} and followed the link", js: true do
          click_link item
          expect(page).to have_selector('h1', content: item)
          end
        end
      end
    end
  end

end