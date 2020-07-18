class AddStartTimeToMemos < ActiveRecord::Migration[6.0]
  def change
    add_column :memos, :start_time, :datetime
  end
end
