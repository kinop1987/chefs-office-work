class AddDetailsToCalendars < ActiveRecord::Migration[6.0]
  def change
    add_column :calendars, :delivery_time, :date
    add_column :calendars, :user_id, :integer
    add_column :calendars, :supplier_id, :integer
    add_column :calendars, :order_id, :integer
    add_column :calendars, :confirm_order_id, :integer
  end
end
