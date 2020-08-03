class Order < ApplicationRecord
  belongs_to :user
  belongs_to :supplier
  has_many :order_details, dependent: :destroy
  has_many :products, through: :order_details
  has_one :notification, dependent: :destroy
  accepts_nested_attributes_for :order_details
  before_validation :calculate_order_quantity

  def calculate_order_quantity
    order_details.each(&:calculate_order_detail_price)
    self.quantity = order_details.map(&:price).sum
  end

  def start_time
    self.delivery_date
  end

  def create_order_notification_by(current_user)
    notification = current_user.notifications.new(
      order_id: id,
      user_id: current_user.id,
      supplier_id: self.supplier.id
    )
    notification.save if notification.valid?
  end

end
