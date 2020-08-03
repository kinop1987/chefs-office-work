class ChangeCarendersToCalendars < ActiveRecord::Migration[6.0]
  def change
    rename_table :carenders, :calendars
  end
end
