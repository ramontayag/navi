module Navi
  module Renderers
    class Base
      attr_accessor :context, :controller, :template

      def initialize(context)
        @context = context
        @controller = controller_from @context
        @template = template_from @controller
      end

      def render(collection)
        raise NotImplementedError
      end

      private

      # Pretty much lifted from 
      # https://github.com/andi/simple-navigation/blob/master/lib/simple_navigation/adapters/rails.rb
      def controller_from(context)
        context.respond_to?(:controller) ? context.controller : context
      end

      # Pretty much lifted from 
      # https://github.com/andi/simple-navigation/blob/master/lib/simple_navigation/adapters/rails.rb
      def template_from(controller)
        controller.respond_to?(:view_context) ? controller.view_context : controller.instance_variable_get(:@template)
      end
    end
  end
end
