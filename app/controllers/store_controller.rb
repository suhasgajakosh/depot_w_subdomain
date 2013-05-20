class StoreController < ApplicationController
	skip_before_filter :authorize
	around_filter :scope_current_tenant
	
  	def index
		@products = Product.all
		@cart = current_cart
  end
end
