require 'spec_helper'

# SimpleNavigation can accept a array of hashes like so
#[
  #{:key => :main, :name => 'Main', :url => '/main', :options => {your options here}, :items => [
    #{:key => :sub1, :name => 'Submenu 1', :url => '/sub1'},
    #{:key => :sub2, :name => 'Submenu 2', :url => '/sub2'}
  #]}, {...next primary item...}
#]
#
# That means this is the output we need if we want to get it working with SimpleNavigation.

describe Navigable::Renderers::SimpleNavigation do
  
end
