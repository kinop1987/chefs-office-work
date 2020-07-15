class CreateCalculatios < ActiveRecord::Migration[6.0]
  def change
    create_table :calculatios do |t|
      t.integer  :user_id, null: false
      t.timestamps
    end
  end
end
