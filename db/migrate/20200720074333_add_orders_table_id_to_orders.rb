class AddOrdersTableIdToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :orders_table_id, :integer
  end
end
