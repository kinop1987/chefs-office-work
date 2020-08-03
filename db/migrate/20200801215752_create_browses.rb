class CreateBrowses < ActiveRecord::Migration[6.0]
  def change
    create_table :browses do |t|
      t.date :delivery_date
      t.integer :user_id
      t.integer :supplier_id
      t.integer :quantity
      t.timestamps
    end
  end
end
