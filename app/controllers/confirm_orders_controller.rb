class ConfirmOrdersController < ApplicationController
  before_action :set_up_supplier, only: [:show, :confirm, :index]
  before_action :receive_order, only: [:show, :confirm, :create]
  before_action :create_params_order, only: [:create, :confirm]

  def index
    @notifications = @supplier.notifications.where(confirm_order_id: nil).order(created_at: "DESC")
    @count = @notifications.count
  end

  def show
    @confirm_order = ConfirmOrder.new
    @confirm_order.confirm_order_details.build
    @confirm_order_details = @confirm_order.confirm_order_details
  end

  def create
    if @confirm_order.save
      @confirm_order.create_confirm_notification_by(current_supplier)
      @order.notification.destroy
      redirect_to supplier_confirm_orders_path, success: "注文を確認しました"

    end

  end

  def confirm
  end

  private
  
  def set_up_supplier
    @supplier = Supplier.find_by(id: current_supplier.id)
  end


  def receive_order
    @order = Order.find(params[:order_id])
    @order_details = @order.order_details
  end

  def confirm_order_params
    params
      .require(:confirm_order).permit(:order_id,
                              :user_id,
                              :supplier_id,
                              :quantity,
                              :total_price,
                              :delivery_date
                             )
  end

  def confirm_order_details_params
    params.require(:confirm_order_details).map do |param|
      ActionController::Parameters.new(param.to_unsafe_h).permit(:product_name,:confirm_order_id, :unit_price, :quantity, :total_price, :product_unit)
    end
  end

  def create_params_order
    @confirm_order = ConfirmOrder.new(confirm_order_params)
    @confirm_order_details = @confirm_order.confirm_order_details.new(confirm_order_details_params)
  end

end


