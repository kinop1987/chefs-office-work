class Order < ApplicationRecord
  belongs_to :user
  belongs_to :supplier
  has_many :order_details, dependent: :destroy
  has_many :products, through: :order_details
  accepts_nested_attributes_for :order_details, allow_destroy: true

 private
  before_save do
    self.quantity = OrderDetail.all.sum(:price)
  end
end
