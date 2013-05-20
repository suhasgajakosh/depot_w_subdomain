class AddTenantToCarts < ActiveRecord::Migration
  def change
  	add_column :carts, :tenant_id, :integer
    add_index :carts, :tenant_id
  end
end
