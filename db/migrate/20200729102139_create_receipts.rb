class CreateReceipts < ActiveRecord::Migration[6.0]
  def change
    create_table :receipts do |t|
      
      t.integer :confirm_order_id, null:false
      t.integer :total_price, null:false
      t.date :delivery_time , null:false
      t.integer :user_id, null:false
      t.timestamps
    end
  end
end
