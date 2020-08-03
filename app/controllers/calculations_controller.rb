class CalculationsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @cost = @user.receipts.where('extract(month from delivery_date) = ?', Time.now.month).sum(:total_price)
    
  end

  
end
