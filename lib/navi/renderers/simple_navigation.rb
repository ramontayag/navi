#require 'simple_navigation/rendering/helpers' # this is where the render_navigation helper is defined

module Navi
  module Renderers
    class SimpleNavigation < Navi::Renderers::Base
      def render(collection)
        items = create_dynamic_items(collection)
        @template.render_navigation :items => items, :expand_all => true
      end

      private

      # Create an array of hashes that can be easily fed into SimpleNavigation
      # like in the following like:
      # https://github.com/andi/simple-navigation/wiki/Dynamic-Navigation-Items
      def create_dynamic_items(collection)
        nav = []
        collection.each do |nav_item|
          nav << {
            :key => @template.dom_id(nav_item).to_sym,
            :name => nav_item.label,
            :url => @template.polymorphic_url(nav_item.link),
            :options => {},
            :items => create_dynamic_items(nav_item.children)
          }
        end
        nav
      end
    end
  end
end
