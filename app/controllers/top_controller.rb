class TopController < ApplicationController
  def index
   if user_signed_in?
      @user = User.find_by(id: current_user.id)
      @date_today = Time.now
      date_yesterday = Time.now.yesterday
      now_month = Time.now.month
      @receipts = @user.receipts
      @yesterday_total_receipts = @receipts.where(delivery_time: date_yesterday).sum(:total_price)
      @today_total_receipts = @receipts.where(delivery_time: @date_today).sum(:total_price)
      @this_month_receipts = @receipts.where('extract(month from delivery_time) = ?', now_month ).sum(:total_price)
  end
    
  end
end
