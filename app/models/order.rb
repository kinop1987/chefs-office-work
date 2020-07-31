class Order < ApplicationRecord
  belongs_to :user
  belongs_to :supplier
  has_many :order_details
  has_many :products, through: :order_details
  accepts_nested_attributes_for :order_details
  before_validation :calculate_order_quantity

  def calculate_order_quantity
    order_details.each(&:calculate_order_detail_price)
    self.quantity = order_details.map(&:price).sum
  end
end
