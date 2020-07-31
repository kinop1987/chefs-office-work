class CreateConfirmOrderDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :confirm_order_details do |t|
      t.integer :confirm_order_id, null:false
      t.integer :order_detail_id, null:false
      t.integer :unit_price, null:false
      t.integer :quantity, null:false
      t.integer :total_price, null:false
      t.date :start_time, null:false
      t.timestamps

    end
  end
end
