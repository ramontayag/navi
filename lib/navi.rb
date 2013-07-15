require 'active_support'
require "active_support/core_ext/module" # so we can use mattr_accessor
require 'active_record'
require 'ordered_tree'
require 'navi/navigable/base'
require 'navi/railtie' if defined?(Rails) # so we can include the rendering helper into Rails
require 'navi/helpers'
require 'navi/navigator/base'
require 'navi/renderers/base'
require 'navi/renderers/simple_navigation'

module Navi
  def self.navigator_class
    self.navigator.to_s.classify.constantize
  end

  mattr_accessor :navigator
  @@navigator ||= :nav_item

  mattr_accessor :renderer
  @@renderer ||= Navi::Renderers::SimpleNavigation::Renderer
end
