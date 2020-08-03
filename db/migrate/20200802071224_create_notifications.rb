class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.integer :supplier_id
      t.integer :order_id
      t.boolean :checked, default: false, null:false
      t.timestamps
    end
  end
end
