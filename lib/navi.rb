require 'active_support'
require "active_support/core_ext/module" # so we can use mattr_accessor
require 'active_record'
require 'ordered_tree'
require 'navi/navigable/base'

module Navi
  module Navigator
    autoload :Base, 'navi/navigator/base'
  end

  module Renderers
    autoload :Base, 'navi/renderers/base'
    autoload :SimpleNavigation, 'navi/renderers/simple_navigation'
  end

  def self.navigator_class
    self.navigator.to_s.classify.constantize
  end

  mattr_accessor :navigator
  @@navigator ||= :nav_item

  mattr_accessor :renderer
  @@renderer ||= Navi::Renderers::SimpleNavigation
end
