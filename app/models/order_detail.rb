class OrderDetail < ApplicationRecord
  #belongs_to :order
  #belongs_to :product

  before_save do
    self.price = unit_price * quantity
  end

end
