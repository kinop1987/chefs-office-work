class AddDetailsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :telephone, :string
    add_column :users, :address, :string
  end
end
