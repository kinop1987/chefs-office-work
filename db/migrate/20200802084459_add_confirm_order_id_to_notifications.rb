class AddConfirmOrderIdToNotifications < ActiveRecord::Migration[6.0]
  def change
    add_column :notifications, :confirm_order_id, :integer
  end
end
