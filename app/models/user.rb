class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :memos, dependent: :destroy
  has_many :user_suppliers
  has_many :suppliers, through: :user_suppliers
  has_many :orders


  def memos
    return Memo.where(user_id: self.id)
  end
         
end
