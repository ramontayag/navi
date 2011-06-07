require File.dirname(__FILE__) + '/../spec_helper'

describe Page do
  it "should be valid" do
    Page.new.should be_valid
  end
end
