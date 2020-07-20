class Order < ApplicationRecord
  belongs_to :orders_table
  validates :name, presence: true
end
