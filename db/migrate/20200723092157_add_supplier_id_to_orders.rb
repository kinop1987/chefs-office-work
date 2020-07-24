class AddSupplierIdToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :supplier_id, :integer, null: false
  end
end
