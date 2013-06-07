require 'spec_helper'

describe "Navigable" do
  context "when deleted" do
    context "and the navigator has a navigable item" do
      before do
        page = FactoryGirl.create(:page, name: "Page name")
        @menu_item = page.to_navigator!
        page.destroy
        @menu_item.reload
      end

      it "should nullify the navigator's (menu item) pointer to itself" do
        @menu_item.navigable.should be_nil
        @menu_item.navigable_id.should be_nil
        @menu_item.navigable_type.should be_nil
      end

      it "should set the label and url" do
        @menu_item.label.should == "Page name"
        @menu_item.url.should == "#"
      end
    end

    context "and the navigable has no navigator item" do
      before do
        @page = FactoryGirl.create(:page, name: "Page name")
      end

      it "should not blow up" do
        expect {@page.destroy}.to_not raise_error
      end
    end
  end
end
