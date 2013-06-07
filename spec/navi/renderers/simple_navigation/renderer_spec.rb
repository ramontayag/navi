require 'spec_helper'

# SimpleNavigation can accept a array of hashes like so
#[
  #{:key => :main, :name => 'Main', :url => '/main', :options => {your options here}, :items => [
    #{:key => :sub1, :name => 'Submenu 1', :url => '/sub1'},
    #{:key => :sub2, :name => 'Submenu 2', :url => '/sub2'}
  #]}, {...next primary item...}
#]
#
# That means this is the output we need if we want to get it working with SimpleNavigation.

describe Navi::Renderers::SimpleNavigation::Renderer do

  describe '#render' do
    before do
      @template = OpenStruct.new
      @controller = OpenStruct.new(view_context: @template)
      @context = OpenStruct.new(controller: @controller)
    end

    it 'should call render_navigation' do
      rendered_navigation = "rendered navigation"

      items = ['items']
      dynamic_items = ['dynamic items']
      Navi::Renderers::SimpleNavigation::DynamicItems.
        stub(:new).with(@template, items, namespace: 'admin').
        and_return(dynamic_items)

      @template.stub(:render_navigation).
        with(expand_all: true, items: dynamic_items).
        and_return(rendered_navigation)

      renderer = described_class.new(@context)
      result = renderer.render(items, namespace: 'admin')
      expect(result).to eq('rendered navigation')
    end
  end

end
