Given /^I am on the puppy adoption site$/ do
visit(HomePage)
end

When /^I click the View Details button for "([^\"]*)"$/ do |name|
  on(HomePage).select_puppy name
end

And /^I click the Adopt Me button$/ do
  on(DetailsPage).add_to_cart
end

When /^I click the Adopt Another Puppy button$/ do
  on(ShoppingCartPage).continue_shoping
end

And /^I click the Complete the adoption button$/ do
  on(ShoppingCartPage).proceed_to_checkout
end

And /^I enter "([^\"]*)" in the name fields$/ do |name|
  on(CheckoutPage).name = name
end

And /^I enter "([^\"]*)" in the address field$/ do |address|
  on(CheckoutPage).address = address
end

And /^I enter "([^\"]*)" in the email field$/ do |email|
  on(CheckoutPage).email = email
end

And /^I select "([^\"]*)" from the pay with dropdown$/ do |pay_type|
  on(CheckoutPage).pay_type = pay_type
end

And /^I click the Place Order button$/ do
  on(CheckoutPage).place_order
end

Then /^I should see "([^\"]*)"$/ do |expected|
  @current_page.text.should include expected
end

Then /^I should see "([^\"]*)" as the name for (line item \d+)$/ do |name, line_item|
  on(ShoppingCartPage).name_for_line_item(line_item).should include name
  end

And /^I should see "([^\"]*)" as the subtotal for (line item \d+)$/ do |subtotal, line_item|
  on(ShoppingCartPage).subtotal_for_line_item(line_item).should include subtotal
end

And /^I should see "([^\"]*)" as the cart total$/ do |total|
  on(ShoppingCartPage).cart_total.should include total
end

And /^I complete the adoption with:$/ do |table|
  on(CheckoutPage).checkout(table.hashes.first) #`hashes` points that table and `first` that first row
end

When /^I complete the adoption using a Credit card$/ do
  on(CheckoutPage).checkout('pay_type' => 'Credit card')
end

When /^I complete the adoption$/ do
  on(CheckoutPage).checkout
end

And /^I complete the adoption of aa puppy$/ do
  on(CheckoutPage).checkout
end

When /^I complete the adoption of a puppy$/ do
=begin
  on(HomePage).select_puppy
  on(DetailsPage).add_to_cart
  on(ShoppingCartPage).proceed_to_checkout
  on(CheckoutPage).checkout
=end
  navigate_all
end

When /^I checkout leaving the name field blank$/ do
=begin
  on(HomePage).select_puppy
  on(DetailsPage).add_to_cart
  on(ShoppingCartPage).proceed_to_checkout
  on(CheckoutPage).checkout('name' => '')
=end
  navigate_to(CheckoutPage).checkout('name' => '')
end

Then /^I should see the error message "([^\"]*)"$/ do |msg|
  #on(CheckoutPage).error_messages.should include msg
  @current_page.should have_error_message msg
end

Given /^I have a pending adoption for "([^\"]*)"$/ do |name|
=begin
  on(HomePage).select_puppy
  on(DetailsPage).add_to_cart
  on(ShoppingCartPage).proceed_to_checkout
  on(CheckoutPage).checkout('name' => name)
=end
  navigate_to(CheckoutPage).checkout('name' => name)
end

When /^I process that adoption$/ do
  visit(LandingPage)
  on(LoginPage).login_to_system
  on(LandingPage).adoptions
  on(ProcessPuppyPage).process_first_puppy
end

When /^I navigate to some page but do something along way/ do
  navigate_to(SomePageInTheMiddleOfTheRoute).do_something
  continue_navigation_to(FinalPageInTheRoute).complete_this_step
end

