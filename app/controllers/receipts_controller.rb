class ReceiptsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @confirm_orders = @user.confirm_orders
  end

  def show
    @user = User.find(params[:user_id])
    @receipt = Receipt.new
    @confirm_order = ConfirmOrder.find(params[:confirm_order_id])
    @confirm_order_details = @confirm_order.confirm_order_details
  end

  def create
    @user = User.find(params[:user_id])
    @receipt = Receipt.new(receipt_params)
    if @receipt.save
      redirect_to user_receipts_path, success: "伝票を受領しました"
    end
  end

  private
   def receipt_params
    params.require(:receipt).permit(:confirm_order_id,:delivery_time,:total_price).merge(user_id: current_user.id)
   end

end
