class OrderDetail < ApplicationRecord
  belongs_to :order


  before_save do
    self.price = self.unit_price * self.quantity
  end

  

end
