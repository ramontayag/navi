require 'spec_helper'

describe Navigable do
  before {reset_database}
  describe "with renderers," do
    before do
      class SomeRenderer
      end
    end

    it "should default to Navigable::Renderers::SimpleNavigation" do
      Navigable.renderer.should == Navigable::Renderers::SimpleNavigation
    end

    it "should allow customization" do
      Navigable.renderer = SomeRenderer
      Navigable.renderer.should == SomeRenderer
    end
  end

  describe "#to_navigator" do
    describe "when the nav_item exists" do
      it "should return the nav_item" do
        c = Category.create
        nav_item = NavItem.create :navigable => c
        c.to_navigator.should == nav_item
      end
    end

    describe "when the nav_item does not exist" do
      it "should return a new nav_item" do
        c = Category.create
        nav_item = c.to_navigator
        nav_item.should be_new_record
        nav_item.navigable.should == c
      end
    end

    describe "and :label is passed" do
      it "should create a new nav_item with the passed label" do
        Category.create.to_navigator(:label => "Bosch").label.should == "Bosch"
      end
    end

    describe "and :title is passed" do
      it "should create a new nav_item with the passed title" do
        Category.create.to_navigator(:title => "Titulo").title.should == "Titulo"
      end
    end
  end
end
