class AddOrderIdToOrderDetail < ActiveRecord::Migration[6.0]
  def change
    add_column :order_details, :order_id, :integer
  end
end
