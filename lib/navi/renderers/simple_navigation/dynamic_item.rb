module Navi
  module Renderers
    module SimpleNavigation
      class DynamicItem < Hash

        def initialize(template, nav_item, options={})
          self[:key] = template.dom_id(nav_item).to_sym
          self[:name] = nav_item.label
          self[:url] = GeneratesUri.execute(template, nav_item, options)
          self[:options] = {title: nav_item.title,
                            class: nav_item.class.name.underscore}
          self[:items] = DynamicItems.new(template, nav_item.children, options)
        end

      end
    end
  end
end
