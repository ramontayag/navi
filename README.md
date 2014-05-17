# navigable

**navi** puts the navigation (aka menu) in the database. That means you and/or your users can edit and control it. It was made with [WordPress' menu editor][wordpress_menu_editor_info] in mind.

Here are a few things to keep in mind:

* navigable - this is the thing in the database, like a Page or a Category, that you've allowed to be added to the navigation (aka menu).
* navigator - this is the record that may or may not point to the navigable item. This is a database record that represents the navigation item (menu item).
* renderer - with all the navigables and navigators, the renderer puts it all together and creates the HTML to form the navigation.

# Installation

The tests run against `Rails 3.2.x` and `Ruby 1.9.2`.

In your Gemfile:

    gem 'navi'

# Usage

All navigation items (aka menu items) are database entries. Thus, you should create your own model for this. By default, the model name `navi` looks for is `nav_item`, so go ahead and make it.

    class NavItem < Navi::Navigator::Base
      # Yup, you don't need to put anything here since most of what you want comes from Navi::Navigator::Base
      # I'll eventually explain what you can override in the wiki.
    end

Then, whatever you want to be able to become a navigation item in your navigation (menu), add `navigable` to the class, like we do to `Page`:

    class Page < ActiveRecord::Base
      navigable
    end

With this, Page will get the following instance methods:

    @page.to_navigator # initialized a new NavItem instance that can be saved into the database with a .save call on it.
    @page.to_navigator! # initializes and saves the new NavItem, all in one call.

You can pass any of the following arguments, in a form of a hash, into `to_navigator`:

* :label
* :title
* :url
* :highlights_on
* :parent_id
* :position
* any other argument you want saved into the table of `nav_items` table

_For more information about each item, see the wiki._

# Rendering it onto a page

You've got your nav_items all set and you want to render it to the menu. I've created a Renderer - the SimpleNavigation renderer that fetches all the nav_items in the database and renders it on the page using [andi's simple-navigation gem][simple_navigation]. This is the default choice. To render stuff into the page, you get the `navi_render` helper:

    <%= navi_render NavItem.roots %>

You must supply an array of top-most items to render. What do I mean? "top-most" means all the root items, for example, or a generation of items. This will render that generation and all their children in a nested `ul`. See `lib/navi/renderers/simple_navigation.rb` for more info.

You can create your own renderer too. For this, see the wiki. I could add these into the gem. Send me a pull request.

## Namespace

You can render all your links in a namespace:

    <%= navi_render NavItem.roots, namespace: 'preview' %>

This is useful if you want to generate the same links but have them all point to a different route. For example, you have a CMS and there's a preview section where you want the links that are generated to be the same, yet point to all other preview pages in the CMS.

# Contributing to navigable

_To develop and run tests, see the Gemfile and read the comments right above the :development, :test, :cucumber group._

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/hotfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

# Copyright

Copyright (c) 2011-2012 Ramon Tayag. See LICENSE.txt for further details.

[wordpress_menu_editor_info]: http://en.support.wordpress.com/menus/
[simple_navigation]: https://github.com/andi/simple-navigation
