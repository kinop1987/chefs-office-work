class ConfirmOrder < ApplicationRecord
  belongs_to :supplier
  belongs_to :user
  has_one :order
  has_one :receipt
  has_one :notification
  has_many :confirm_order_details, dependent: :destroy
  accepts_nested_attributes_for :confirm_order_details
  before_validation :calculate_confirm_order_total_price
  validates :delivery_date, presence: true
  validate  :date_not_before_today

  def calculate_confirm_order_total_price
    confirm_order_details.each(&:calculate_confirm_order_detail_total_price)
    self.total_price = confirm_order_details.map(&:total_price).sum
  end

  def date_not_before_today
    errors.add(:delivery_date, "は今日以降のものを選択してください") if delivery_date.nil? || delivery_date < Date.today
  end

  def create_confirm_notification_by(current_supplier)
    notification = current_supplier.notifications.new(
      confirm_order_id: id,
      user_id: self.user.id,
      supplier_id: current_supplier.id
    )
    notification.save if notification.valid?
  end


end
