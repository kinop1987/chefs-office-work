class AddCheckedToNotifications < ActiveRecord::Migration[6.0]
  def change
    add_column :notifications, :checked, :boolean, default: false, null: false
  end
end
