require 'spec_helper'

class SomeRenderer
end

describe Navigable do
  describe "with renderers," do
    it "should default to Navigable::Renderers::SimpleNavigation" do
      Navigable.renderer.should == Navigable::Renderers::SimpleNavigation
    end

    it "should allow customization" do
      Navigable.renderer = SomeRenderer
      Navigable.renderer.should == SomeRenderer
    end
  end
end
