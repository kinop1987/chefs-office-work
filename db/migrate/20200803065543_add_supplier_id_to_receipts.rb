class AddSupplierIdToReceipts < ActiveRecord::Migration[6.0]
  def change
    add_column :receipts, :supplier_id, :integer
  end
end
