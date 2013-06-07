module Navi
  module Renderers
    class Base
      attr_accessor :context, :controller, :template

      def initialize(context)
        @context = context
      end

      def render(collection)
        raise NotImplementedError
      end

      private

      def controller
        @controller ||= if @context.respond_to?(:controller)
                          @context.controller
                        else
                          @context
                        end
      end

      def template
        @template ||= if controller.respond_to?(:view_context)
                        controller.view_context
                      else
                        controller.instance_variable_get(:@template)
                      end
      end
    end
  end
end
