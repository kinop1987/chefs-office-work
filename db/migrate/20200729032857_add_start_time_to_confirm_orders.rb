class AddStartTimeToConfirmOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :confirm_orders, :start_time, :datetime
  end
end
