class Product < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 50 }
  validates :price,numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :availability, inclusion: { in: [true, false] }
  belongs_to :supplier
end
