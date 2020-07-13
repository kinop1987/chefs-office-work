class CreateSuppliers < ActiveRecord::Migration[6.0]
  def change
    create_table :suppliers do |t|
      t.string :name, null: false, unique: true
      t.integer :telephone, null: false, unique: true
      t.string  :pic
      t.string :website
      t.timestamps
    end
  end
end
