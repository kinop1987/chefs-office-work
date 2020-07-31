class ChangeCalculatiosToCalculations < ActiveRecord::Migration[6.0]
  def change
    rename_table :calculatios, :calculations

  end
end
