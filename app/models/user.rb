class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :memos, dependent: :destroy
  has_many :orders
  has_many :confirm_orders
  has_many :suppliers, through: :confirm_orders
  has_many :receipts
  has_one :calculation
  has_many :notifications, dependent: :destroy

  def start_time
    self.confirm_orders.delivery_time
  end
end
