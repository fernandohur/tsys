Feature: bla

Scenario: when there are no products, nothing is shown.
  Given there is only 0 products
  And Im on products page
  Then I should see "It seems you do not have any products uploaded."

Scenario: when there are products...I should see them
  Given there is only 1 products
  And Im on products page
  Then I should not see "It seems you do not have any products uploaded."

Scenario: link to create a new product should work
  Given Im on products page
  And I click "Create a new product"
  Then I should be on "add product page"

Scenario: When I delete a product, it should no longer exists
  And there is only 2 products
  Given Im on the first product page
  When I click on delete
  Then Im on products page
  And there should be only 1 product