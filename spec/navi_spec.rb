require 'spec_helper'

describe Navi do
  before {reset_database}
  describe "with renderers," do
    before do
      class SomeRenderer
      end
    end

    it "should default to Navi::Renderers::SimpleNavigation" do
      Navi.renderer.should == Navi::Renderers::SimpleNavigation
    end

    it "should allow customization" do
      Navi.renderer = SomeRenderer
      Navi.renderer.should == SomeRenderer
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

    describe "when a parent is specified" do
      it "should be created under that parent" do
        cars = Category.create :name => "Cars"
        chevy = Category.create :name => "Chevy"
        cars_nav = cars.to_navigator
        cars_nav.save
        puts "This is the cars_nav: #{cars_nav.inspect}"
        chevy_nav = chevy.to_navigator(:parent_id => cars_nav.id)
        puts "This is the chevy_nav: #{chevy_nav.inspect}"
        chevy_nav.save
        puts "This is the chevy_nav: #{chevy_nav.inspect}"
        #chevy_nav.reload
        chevy_nav.parent.should == cars_nav
      end
    end
  end
end
