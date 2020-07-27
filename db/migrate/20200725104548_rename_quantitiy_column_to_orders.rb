class RenameQuantitiyColumnToOrders < ActiveRecord::Migration[6.0]
  def change
    rename_column :orders, :quantitiy, :quantity
  end
end
