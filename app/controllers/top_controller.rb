class TopController < ApplicationController
  def index
    @date_today = Time.now.strftime("%Y-%m-%d ")
   if user_signed_in?
      @user = User.find_by(id: current_user.id)
      date_yesterday = Time.now.yesterday.strftime("%Y-%m-%d")
      now_month = Time.now.month
      @receipts = @user.receipts
      @yesterday_total_receipts = @receipts.where(delivery_date: date_yesterday).sum(:total_price)
      @today_total_receipts = @receipts.where(delivery_date: @date_today).sum(:total_price)
      @this_month_receipts = @receipts.where('extract(month from delivery_date) = ?', now_month ).sum(:total_price)
      @notifications = @user.notifications.where(order_id: nil).count
   end
   if supplier_signed_in?
    @supplier = Supplier.find_by(id: current_supplier.id)
    @notifications = @supplier.notifications.where(confirm_order_id: nil).count
    

   end
    
  end
end
