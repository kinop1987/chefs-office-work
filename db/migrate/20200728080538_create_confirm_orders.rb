class CreateConfirmOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :confirm_orders do |t|
      
      t.integer :user_id, null:false
      t.integer :supplier_id, null:false
      t.integer :order_id, null:false
      t.timestamps
      t.date    :start_time, null:false
    end
  end
end
