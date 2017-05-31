class CheckoutPage
# with PageObject it looks

  DEFAULT_DATA = {
      'name' => 'Cheezy',
      'address' => '123 Main Street',
      'email' => 'cheezy@example.com',
      'pay_type' => 'Purchase order'
  }

  include PageObject
  text_field(:name, :id => 'order_name')
  textarea(:address, :id => 'order_address')
  text_field(:email, :id => 'order_email')
  select_list(:pay_type, :id => 'order_pay_type')
  button(:place_order, :value => 'Place Order')

  def checkout_no_hash(data) #array of hashes
    self.name = data['name']
    self.address = data['address']
    self.email = data['email']
    self.pay_type = data['pay_type']
    place_order
  end

  def checkout(data = {}) #DEFAULT DATA are been used
=begin    data = DEFAULT_DATA.merge(data)
    self.name = data['name']
    self.address = data['address']
    self.email = data['email']
    self.pay_type = data['pay_type']
    place_order
=end

  #in PageObject 0.5.3 and higher is enough
    populate_page_with DEFAULT_DATA.merge(data)
    place_order
  end
end
