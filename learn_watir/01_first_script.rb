require 'rubygems'
require 'watir-webdriver'
browser = Watir::Browser.new :chrome
browser.goto 'http://puppies.herokuapp.com/'
sleep 1
browser.button(:value => 'View Details', :index => 1).click
browser.button(:value => 'Adopt Me!').click
browser.button(:value => 'Complete the Adoption').click

browser.text_field( :id => 'order_name').set('name')
browser.textarea( :id => 'order_address').set('123 street')
browser.text_field( :id => 'order_email').set('m@email.com')
browser.select_list( :id => 'order_pay_type').select('Check')
browser.button(:value => 'Place Order').click
fail 'Browser text did not match expected value' unless browser.text.include? 'Thank you for adopting a puppy!'
sleep 5
browser.close