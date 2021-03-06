Feature: Adopting puppies
  As a puppy lover
  I want to adopt puppies
  So they can chew my furniture

Background:
  Given I am on the puppy adoption site

Scenario Outline: Adopting one puppy outline
  When I click the View Details button for "Brook"
  And I click the Adopt Me button
  And I click the Complete the Adoption button
  And I enter "<name>" in the name fields
  And I enter "<address>" in the address field
  And I enter "<email>" in the email field
  And I select "<pay_type>" from the pay with dropdown
  And I click the Place Order button
  Then I should see "Thank you for adopting a puppy!"

  Examples:
  |name     |        address    |   email               | pay_type    |
  |Cheezy   | 123 Main Street   | cheezy@example.com    | Credit card |
  |Cheezy_01| 123 Main Street_01| cheezy_01@example.com | Credit card |

Scenario: Adopting two puppies
  When I click the View Details button for "Brook"
  And I click the Adopt Me button
  And I click the Adopt Another Puppy button
  And I click the View Details button for "Hanna"
  And I click the Adopt Me button
  And I click the Complete the Adoption button
  And I enter "Cheezy" in the name fields
  And I enter "123 Main Street" in the address field
  And I enter "cheezy@example.com" in the email field
  And I select "Credit card" from the pay with dropdown
  And I click the Place Order button
  Then I should see "Thank you for adopting a puppy!"

Scenario: Validate cart with one puppy
  When I click the View Details button for "Brook"
  And I click the Adopt Me button
  Then I should see "Brook" as the name for line item 1
  And I should see "$34.95" as the subtotal for line item 1
  And I should see "$34.95" as the cart total

Scenario: Validate cart with two puppies
  When I click the View Details button for "Brook"
  And I click the Adopt Me button
  And I click the Adopt Another Puppy button
  And I click the View Details button for "Hanna"
  And I click the Adopt Me button
  Then I should see "Brook" as the name for line item 1
  And I should see "$34.95" as the subtotal for line item 1
  And I should see "Hanna" as the name for line item 2
  And I should see "$22.99" as the subtotal for line item 2
  And I should see "$57.94" as the cart total


Scenario: Adopting one puppy (Inline tables)
  When I click the View Details button for "Hanna"
  And I click the Adopt Me button
  And I click the Complete the Adoption button
  And I complete the adoption with:
  | name  | address         | email              | pay_type    |
  |Cheezy | 123 Main Street | cheezy@example.com | Credit card |
  Then I should see "Thank you for adopting a puppy!"

Scenario: Adopting one puppy (Default Data)
  When I click the View Details button for "Hanna"
  And I click the Adopt Me button
  And I click the Complete the adoption button
  And I complete the adoption of aa puppy
  Then I should see "Thank you for adopting a puppy!"

Scenario: Adopting a puppy using partial default data
  When I click the View Details button for "Hanna"
  And I click the Adopt Me button
  And I click the Complete the Adoption button
  And I complete the adoption using a Credit card
  Then I should see "Thank you for adopting a puppy"

Scenario: Adopting a puppy using all default data
  When I click the View Details button for "Hanna"
  And I click the Adopt Me button
  And I click the Complete the Adoption button
  And I complete the adoption
  Then I should see "Thank you for adopting a puppy"

Scenario: Thank you message should be displayed
  When I complete the adoption of a puppy
  Then I should see "Thank you for adopting a puppy"

Scenario: Name is a required field
  When I checkout leaving the name field blank
  Then I should see the error message "Name can't be blank"

Scenario: Verify message when adoption is processed
  Given I have a pending adoption for "Tom Jones"
  When I process that adoption
  Then I should see "Please thank Tom Jones for the order!"
  # Message is "Please thank <adopter's name> for the order!"

