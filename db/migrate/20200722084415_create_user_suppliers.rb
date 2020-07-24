class CreateUserSuppliers < ActiveRecord::Migration[6.0]
  def change
    create_table :user_suppliers do |t|
      t.references :user, index: true, foreign_key: true
      t.references :supplier, index: true, foreign_key: true
      t.timestamps
    end
  end
end
