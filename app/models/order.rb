class Order < ApplicationRecord::Base
  validates :name, presence: true
end
