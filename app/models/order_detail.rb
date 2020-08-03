class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product


  def calculate_order_detail_price
    self.price = self.unit_price * self.quantity
  rescue
    self.price = 0
  end

end
