class AddProductNameToConfirmOrderDetails < ActiveRecord::Migration[6.0]
  def change
    add_column :confirm_order_details, :product_name, :string, null:false
  end
end
