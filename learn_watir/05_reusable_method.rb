require 'rubygems'
require 'watir-webdriver'
require_relative '06_adoption_helper'

include AdoptionHelper

@browser = Watir::Browser.new :chrome
@browser.goto 'http://puppies.herokuapp.com/'
sleep 1
adopt_puppy_number(2)
continue_adopting_puppies
adopt_puppy_number(1)
checkout_with('Cheezy', '123 Main Str', 'cheezy@foo.com', 'Check')
sleep 3
verify_page_contains('Thank you for adopting a puppy!')
sleep 2
@browser.close