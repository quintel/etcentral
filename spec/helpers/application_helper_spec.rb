require 'spec_helper'

describe ApplicationHelper do
  describe "information_links" do
    it "should not be empty" do
      expect(information_links).not_to be_nil
    end
  end
end