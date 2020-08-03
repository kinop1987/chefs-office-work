class Receipt < ApplicationRecord
  belongs_to :user
  belongs_to :supplier
  has_one :confirm_order

end
