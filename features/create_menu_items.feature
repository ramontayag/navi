Feature: So that I can create a menu for my viewers to navigate my site
  As a user
  I should be able to manage menu items

  @javascript
  Scenario: Adding menu items
    Given a page "Home" exists
    And a category "Misc" exists
    And I am on the menu items page
    When I create the page "Home" menu item
    Then I should see "Home" in the list of menu items
    When I create the category "Misc" menu item
    Then I should see "Misc" in the list of menu items
