class AddTotalPriceToConfirmOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :confirm_orders, :total_price, :integer, null:false
  end
end
