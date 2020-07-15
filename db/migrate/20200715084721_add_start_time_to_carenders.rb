class AddStartTimeToCarenders < ActiveRecord::Migration[6.0]
  def change
    add_column :carenders, :start_time, :datetime
  end
end
