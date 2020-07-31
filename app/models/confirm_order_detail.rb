class ConfirmOrderDetail < ApplicationRecord
  belongs_to :confirm_order
  has_one :order_detail

  def calculate_confirm_order_detail_total_price
    self.total_price = self.unit_price * self.quantity
  rescue
    self.total_price = 0
  end
end
