class OrdersTable < ApplicationRecord
  belongs_to :supplier
  has_many :orders
  accepts_nested_attributes_for :orders
end
