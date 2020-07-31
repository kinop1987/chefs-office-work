class AddCulumnsToCalculations < ActiveRecord::Migration[6.0]
  def change
    add_column :calculations, :income, :integer
    add_column :calculations, :last_invent, :integer
    add_column :calculations, :this_invent, :integer
    add_column :calculations, :cost, :integer
    add_column :calculations, :cost_rate, :integer
  end
end
