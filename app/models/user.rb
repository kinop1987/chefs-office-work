class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :memos, dependent: :destroy

  def memos
    return Memo.where(user_id: self.id)
  end
         
end
