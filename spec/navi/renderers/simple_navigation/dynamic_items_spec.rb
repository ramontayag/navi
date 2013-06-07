require 'spec_helper'

describe Navi::Renderers::SimpleNavigation::DynamicItems do

  describe 'initialization' do
    it 'should be an array of DynamicItem objects, passing any options' do
      template = double

      nav_item_1 = double
      nav_item_2 = double
      nav_items = [nav_item_1, nav_item_2]

      dynamic_item_1 = double
      Navi::Renderers::SimpleNavigation::DynamicItem.
        stub(:new).with(template, nav_item_1, extra: 'options').
        and_return(dynamic_item_1)

      dynamic_item_2 = double
      Navi::Renderers::SimpleNavigation::DynamicItem.
        stub(:new).with(template, nav_item_2, extra: 'options').
        and_return(dynamic_item_2)

      dynamic_items = described_class.new(template, nav_items, extra: 'options')
      expect(dynamic_items.size).to eq(2)
      expect(dynamic_items[0]).to eq(dynamic_item_1)
      expect(dynamic_items[1]).to eq(dynamic_item_2)
    end
  end

end
