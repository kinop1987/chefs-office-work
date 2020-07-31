class AddDetailsToCalculations < ActiveRecord::Migration[6.0]
  def change
    add_column :calculations, :confirm_order_id, :integer,null:false
    add_column :calculations, :total_price, :integer, null:false
    add_column :calculations, :delivery_time, :date, null:false
  end
end
