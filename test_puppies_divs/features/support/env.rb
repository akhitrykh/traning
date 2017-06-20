require 'rspec'
require 'page-object'
require 'faker'

World(PageObject::PageFactory)

require 'require_all'

require_rel 'pages'

PageObject::PageFactory.routes = {
    :default => [[HomePage, :select_puppy],
                 [DetailsPage, :add_to_cart],
                 [ShoppingCartPage, :proceed_to_checkout],
                 [CheckoutPage, :checkout]],
}