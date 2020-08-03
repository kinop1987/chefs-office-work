class RenameDeliveryTimeColumnToReceipts < ActiveRecord::Migration[6.0]
  def change
    rename_column :receipts, :delivery_time, :delivery_date
  end
end
