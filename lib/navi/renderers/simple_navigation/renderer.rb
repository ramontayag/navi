module Navi
  module Renderers
    module SimpleNavigation
      class Renderer < Navi::Renderers::Base

        def render(collection, *args)
          options = Hash[*args]
          options[:expand_all] ||= true

          @dynamic_items_options = {}
          @dynamic_items_options[:namespace] = options.delete(:namespace)

          options[:items] ||= create_dynamic_items(collection)

          template.render_navigation options
        end

        private

        def create_dynamic_items(collection)
          DynamicItems.new(template, collection, @dynamic_items_options)
        end

      end
    end
  end
end
