class CreateCarenders < ActiveRecord::Migration[6.0]
  def change
    create_table :carenders do |t|
      t.text :body

      t.timestamps 
    end
  end
end
