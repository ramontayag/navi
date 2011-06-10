# This helper is a module that will get included into Rails via the
# lib/navi/railtie class
#
# It allows us to be in the context of the controller it is being included
# into: when this module is included to ActionView and the view/controller
# calls the render method, "self" will refer to the view or controller
# context
module Navi
  module Helpers
    def self.included(base)
      #puts "Navi::Helpers was included into #{base}"
    end

    def navi_render(collection)
      renderer.render(collection)
    end

    private

    def renderer
      @renderer ||= Navi.renderer.new(self)
    end
  end
end
