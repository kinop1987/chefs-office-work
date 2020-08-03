class Notification < ApplicationRecord
  default_scope->{order(created_at: :desc)}

    belongs_to :order, optional: true
    belongs_to :confirm_order, optional: true
    belongs_to :user,optional: true
    belongs_to :supplier, optional: true

end
