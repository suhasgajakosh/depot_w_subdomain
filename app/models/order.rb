class Order < ActiveRecord::Base
	has_many :line_items, :dependent => :destroy
	PAYMENT_TYPES = [ "Check", "Credit card", "Purchase order" ]

	validates :name, :address, :email, :paytype, :presence => true
	validates :paytype, :inclusion => PAYMENT_TYPES

	default_scope { where(tenant_id: Tenant.current_id) }
	
	def add_line_items_from_cart(cart)
		cart.line_items.each do |item|
			item.cart_id = nil
			line_items << item
		end
	end
end
