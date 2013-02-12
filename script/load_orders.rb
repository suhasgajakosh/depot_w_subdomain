Order.transaction do 
	(1..100).each do |i|
		Order.create(:name => "Customer #{i}", :address => "#{i} Min Street", :email => "customer-#{i}@example.com", :paytype => "Check")
	end
end