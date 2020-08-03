class CalendarsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @orders = @user.orders
    @receipts = @user.receipts
  end

    
end

