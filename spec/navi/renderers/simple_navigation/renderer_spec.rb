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

describe Navi::Renderers::SimpleNavigation::Renderer do
  #class ControllerMock
    #include SimpleNavigation::Helpers
  #end
  #it "should properly convert all the nav items to an array of hashes SimpleNavigation gem can understand" do
    #about = Page.make(:name => "About").to_navigator!
    #home = Page.make(:name => "Home").to_navigator!
    #board_members = Page.make(:name => "Board Members").to_navigator!(:parent_id => about.id)

    #rendered_navigation = Navi::Renderers::SimpleNavigation.render(MenuItem.roots)
    #rendered_navigation.should == "something"
    #[
      #{
        #:key => :"page_#{about.id}",
        #:name => "About",
        #:url => "/pages/#{about.id}",
        #:options => {},
        #:items => [
          #{
            #:key => :"page_#{board_members.id}",
            #:name => "Board Members",
            #:url => "/pages/#{board_members.id}",
            #:options => {},
            #:items => []
          #}
        #]
      #},
      #{
        #:key => :"page_#{home.id}",
        #:name => "Home",
        #:url => "/pages/#{home.id}",
        #:options => {},
        #:items => []
      #}
    #]
  #end
end
