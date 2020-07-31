class Product < ActiveRecord::Base
  #validates :name, presence: true, uniqueness: true
  #validates :unit, presence: true
  #validates :price, numericality: true
  #validates :availability, inclusion: { in: [true, false] }
  belongs_to :supplier

end