# This helper is a module that will get included into Rails via the
# lib/navi/railtie class
#
# It allows us to be in the context of the controller it is being included
# into: when this module is included to ActionView and the view/controller
# calls the render method, "self" will refer to the view or controller
# context
module Navi
  module Helpers
    # Don't declare @renderer in here, or else it won't play nicely with Rails.

    def self.included(base)
      #puts "Navi::Helpers was included into #{base}"
    end

    def navi_render(collection, *args)
      @navi_renderer ||= Navi.renderer.new(self)
      @navi_renderer.render(collection, *args)
    end
  end
end
