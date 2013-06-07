module Navi
  module Renderers
    module SimpleNavigation
      class GeneratesUri
        easy_class_to_instance

        def initialize(template, nav_item, options={})
          @template = template
          @nav_item = nav_item
          @namespace = options[:namespace]
        end

        def execute
          url.is_a?(String) ? url : generated_path
        end

        private

        def url
          @nav_item.url
        end

        def generated_path
          args = [@namespace].flatten.compact
          args << url
          @template.polymorphic_path(args)
        end

      end
    end
  end
end
