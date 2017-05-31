class HomePage
  include PageObject
  #button(:first_puppy, :value => 'View Details', :index => 0)
  #button(:second, :value => 'View Details', :index => 1)
  page_url('http://puppies.herokuapp.com/')

  def select_puppy_number(num)
    button_element(:value => 'View Details', :index => num - 1).click
  end
end