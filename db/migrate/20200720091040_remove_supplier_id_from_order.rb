class RemoveSupplierIdFromOrder < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :supplier_id, :integer
  end
end
