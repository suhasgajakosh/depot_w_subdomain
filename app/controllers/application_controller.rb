class ApplicationController < ActionController::Base
	  skip_before_filter :authorize
  	#before_filter :authorize
  	protect_from_forgery
  	around_filter :scope_current_tenant

  private

  	def current_user
    	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  	end
  	helper_method :current_user
  
  	def current_tenant
    	Tenant.find_by_subdomain! request.subdomain
  	end
  	helper_method :current_tenant
  
  	def scope_current_tenant
    	Tenant.current_id = current_tenant.id
      yield
    	ensure
      	Tenant.current_id = nil
  	 end
  
  	def current_cart
		  Cart.find(session[:cart_id])
	   rescue ActiveRecord::RecordNotFound
		  cart = Cart.create
		  session[:cart_id] = cart.id
		  cart
	 end


	protected

	def authorize
		unless User.find_by_id(session[:user_id])
			redirect_to login_url, notice: "Please Log in"
		end
	end
end
