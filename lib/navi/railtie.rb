# What is a railtie?
# tl;dr => Allows us to hook into Rails add add stuff to it
# http://www.rorexperts.com/what-is-railtie-t1898.html

module Navi
  class Railtie < Rails::Railtie
    initializer "navi.helpers" do
      ActionView::Base.send :include, Navi::Helpers
    end
  end
end
