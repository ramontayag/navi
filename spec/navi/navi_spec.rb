require 'spec_helper'

describe Navi do
  before :all do
    # Since our test app uses :menu_item instead of the default :nav_item,
    # Set it here
    Navi.navigator = :menu_item
  end

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
        nav_item = MenuItem.create :navigable => c
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
        chevy_nav = chevy.to_navigator(:parent_id => cars_nav.id)
        chevy_nav.save
        chevy_nav.parent.should == cars_nav
      end
    end
  end

  describe "#to_navigator!" do
    it "should immediately create the navigator item" do
      category = Factory :category
      navigator = category.to_navigator!
      navigator.should_not be_new_record
    end
  end
end
