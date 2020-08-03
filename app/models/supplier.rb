class Supplier < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders
  has_many :products
  has_many :receipts
  has_many :users, through: :orders
  has_many :notifications, dependent: :destroy
end
