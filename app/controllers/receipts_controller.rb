class ReceiptsController < ApplicationController 
  before_action :set_up_confirm_order, only: [:show,:create]
  before_action :set_up_user, only: [:index,:show,:create,:group]

  def index
    @notifications = @user.notifications.where(order_id: nil).order(created_at: "DESC")
    @count = @notifications.count
  end

  def show
    @receipt = Receipt.new
  end

  def create
    @receipt = Receipt.new(receipt_params)
    if @receipt.save
      redirect_to user_receipts_path, success: "伝票を受領しました"
      @confirm_order.notification.destroy
    end
  
  end

  def group
    @receipts = @user.receipts.where(delivery_date: params[:delivery_date])
    @count = @receipts.count
    @total_price = @receipts.sum(:total_price)
  end

  private
   def receipt_params
    params.require(:receipt).permit(:confirm_order_id,:delivery_date,:total_price,:supplier_id).merge(user_id: current_user.id)
   end

   def set_up_confirm_order
    @confirm_order = ConfirmOrder.find(params[:confirm_order_id])
    @confirm_order_details = @confirm_order.confirm_order_details
   end

   def set_up_user
    @user = User.find(params[:user_id])
   end
    

end
