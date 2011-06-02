require 'spec_helper'

class NavItem < ActiveRecord::Base
  include Navigable::NavigationItem
end

class Category < ActiveRecord::Base
end

describe NavItem do
  before {reset_database}

  describe "#label" do
    it "should return the database entry when it exists" do
      NavItem.new(:label => "Samba").label.should == "Samba"
    end

    describe "when no label field exists" do
      describe "and there is a navigable model" do
        it "should default to the specified field in the navigable model" do
          navigate Category, :label => :nombre do
            c = Category.create :nombre => "Banana"
            nav_item = NavItem.new(:navigable => c)
            nav_item.label.should == "Banana"
          end
        end
      end
      
      describe "and there is no navigable model" do
        it "should return nil" do
          NavItem.new.label.should == nil
        end
      end
    end
  end
end
