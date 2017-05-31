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

And /^I click the Complete the Adoption button$/ do
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


And /^I complete the adoption of a puppy$/ do
  on(CheckoutPage).checkout
end

When /^I complete the adoption using a Credit card$/ do
  on(CheckoutPage).checkout('pay_type' => 'Credit card')
end

When /^I complete the adoption$/ do
  on(CheckoutPage).checkout
end

