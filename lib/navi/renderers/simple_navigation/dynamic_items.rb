# Create an array of hashes that can be easily fed into SimpleNavigation
# like in the following like:
# https://github.com/andi/simple-navigation/wiki/Dynamic-Navigation-Items
module Navi
  module Renderers
    module SimpleNavigation
      class DynamicItems < Array

        def initialize(template, nav_items, options={})
          @template = template
          @options = options
          nav_items.each do |nav_item|
            self << dynamic_item_for(nav_item)
          end
        end

        private

        def dynamic_item_for(nav_item)
          DynamicItem.new @template, nav_item, @options
        end

      end
    end
  end
end
