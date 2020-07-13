class CreateMemos < ActiveRecord::Migration[6.0]
  def change
    create_table :memos do |t|
      t.text :memo
      t.integer :user_id
      t.timestamps
    end
  end
end
