class AddDeliveryDateToConfirmOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :confirm_orders, :delivery_date, :date, null:false
  end
end
