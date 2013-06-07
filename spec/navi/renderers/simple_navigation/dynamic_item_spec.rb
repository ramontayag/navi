require 'spec_helper'

describe Navi::Renderers::SimpleNavigation::DynamicItem do

  let(:template) { double }

  let(:nav_item) do
    OpenStruct.new(title: 'nav title',
                   label: 'item label',
                   children: ['child1', 'child2'])
  end

  subject { described_class.new(template, nav_item, namespace: 'namespace') }

  before do
    template.stub(:dom_id).with(nav_item) { 'best_dom_id' }

    Navi::Renderers::SimpleNavigation::GeneratesUri.stub(:execute).
      with(template, nav_item, namespace: 'namespace').
      and_return('my generated url')

    @dynamic_items = ['dynamic', 'items']
    Navi::Renderers::SimpleNavigation::DynamicItems.stub(:new).
      with(template, nav_item.children, namespace: 'namespace').
      and_return(@dynamic_items)
  end

  it "should set the key based on the template's dom_id of the nav item" do
    expect(subject[:key]).to eq(:best_dom_id)
  end

  it 'should set the name from the nav item label' do
    expect(subject[:name]).to eq('item label')
  end

  it 'should set the url' do
    expect(subject[:url]).to eq('my generated url')
  end

  it 'should set the options title and class' do
    expect(subject[:options]).to eq({title: 'nav title',
                                     class: 'open_struct'})
  end

  it 'should set the items based on the objects given' do
    expect(subject[:items]).to eq(@dynamic_items)
  end

end
