class AddDetailsToOrderDetails < ActiveRecord::Migration[6.0]
  def change
    add_column :order_details, :user_id, :integer
  end
end
