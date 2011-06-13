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
          item = {}
          item[:key] = @template.dom_id(nav_item).to_sym
          item[:name] = nav_item.label
          if nav_item.link.is_a?(String)
            item[:url] = nav_item.link
          else # it's a database record then!
            puts "This is the link: #{nav_item.link.inspect}"
            item[:url] = @template.polymorphic_path(nav_item.link)
            #item[:url] = "/"
          end
          item[:options] = {:title => nav_item.title, :class => nav_item.class.name.underscore}
          item[:items] = create_dynamic_items(nav_item.children)

          nav << item
        end
        nav
      end
    end
  end
end
