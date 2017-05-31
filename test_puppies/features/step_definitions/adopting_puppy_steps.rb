Given /^I am on the puppy adoption site$/ do
@browser.goto 'http://puppies.herokuapp.com/'
@home = HomePage.new(@browser)
end

When /^I click the first View Details button$/ do
  #@browser.button(:value => 'View Details', :index => 0).click
  #@home.first_puppy
  #@home.select_puppy_number 1
  on(HomePage).select_puppy_number 1
  sleep 2
  @details = DetailsPage.new(@browser)
end

When /^I click the second View Details button$/ do
  #@browser.button(:value => 'View Details', :index => 1).click
  @home.select_puppy_number 2
  sleep 2
  @details = DetailsPage.new(@browser)
end

And /^I click the Adopt Me button$/ do
  #@browser.button(:value => 'Adopt Me!').click
  @details.add_to_cart
  @cart = ShoppingCartPage.new(@browser)
end

And /^I click the Complete the Adoption button$/ do
  #@browser.button(:value => 'Complete the Adoption').click
  @cart.proceed_to_checkout
  @checkout = CheckoutPage.new(@browser)
end

=begin
And /^I enter "Cheezy" in the name fields$/ do
  @browser.text_field( :id => 'order_name').set('Cheezy')
end
=end

And /^I enter "([^\"]*)" in the name fields$/ do |name|
  #@browser.text_field( :id => 'order_name').set(name)
  @checkout.name = name
end

And /^I enter "([^\"]*)" in the address field$/ do |address|
  #@browser.textarea( :id => 'order_address').set(address)
  @checkout.address = address
end

And /^I enter "([^\"]*)" in the email field$/ do |email|
  #@browser.text_field( :id => 'order_email').set(email)
  @checkout.email = email
end

And /^I select "([^\"]*)" from the pay with dropdown$/ do |pay_type|
  #@browser.select_list( :id => 'order_pay_type').select(pay_type)
  @checkout.pay_type = pay_type
end

And /^I click the Place Order button$/ do
  #@browser.button(:value => 'Place Order').click
  #@cart.continue_shopping
  @checkout.place_order
end

Then /^I should see "([^\"]*)"$/ do |expected|
  @browser.text.should include expected
end

And /^I click Adopt Another puppy$/ do
  @browser.button(:value => 'Adopt Another Puppy').click
end

Then /^I should see "([^\"]*)" as the name for (line item \d+)$/ do |name, line_item|
  #cart_line_item(line_item.to_i)[1].text.should include name
  #@cart.name_for_line_item(line_item.to_i).should include name
  @cart.name_for_line_item(line_item).should include name
  end

And /^I should see "([^\"]*)" as the subtotal for (line item \d+)$/ do |subtotal, line_item|
  #cart_line_item(line_item.to_i)[3].text.should == subtotal
  @cart.subtotal_for_line_item(line_item.to_i).should include subtotal
end

And /^I should see "([^\"]*)" as the cart total$/ do |total|
  #@browser.td(:class => "total_cell").text.should == total
  @cart.cart_total.should include total
end
