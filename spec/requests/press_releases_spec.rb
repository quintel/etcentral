require 'spec_helper'

describe Page do
  it "raises 404 when file not found" do
    expect { visit '/press_releases/2012-06-04_energieoverheid' }.to raise_error(ActionController::RoutingError)
  end

end