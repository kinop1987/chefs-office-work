class AddQuantityToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :quantitiy, :integer
  end
end
