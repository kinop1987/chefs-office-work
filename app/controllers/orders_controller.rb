class OrdersController < ApplicationController
  before_action :set_up_supplier ,only: [:new,:create,:confirm]
  before_action :set_up_user, only: [:index,:new,:confirm,:show, :group]
  before_action :create_params_order , only: [:create,:confirm]

  def index
    @suppliers = Supplier.all
  end

  def new
    @order = Order.new
    @order.order_details.build
    @order_details = @order.order_details
  end

  def create
    @order.save
    redirect_to user_orders_path, success: "発注を完了しました"
    @order.create_order_notification_by(current_user)

  end

  def confirm
    
  end

  def show
    @order = Order.find(params[:order_id])
  end

  def group
    @orders = @user.orders.where(delivery_date: params[:delivery_date])
    @count = @orders.count
  end


  private

  def order_params
    params
      .require(:order).permit(:user_id,
                              :supplier_id,
                              :quantity,
                              :delivery_date)
  end

  def order_details_params
    params.require(:order_details).map do |param|
      ActionController::Parameters.new(param.to_unsafe_h).permit(:product_id, :order_id, :unit_price, :quantity)
    end
  end

  def set_up_user
    @user = User.find(params[:user_id])
  end

  def set_up_supplier
    @supplier = Supplier.find(params[:supplier_id])
    @products = @supplier.products
  end

  def create_params_order
    @order = Order.new(order_params)
    @order_details = @order.order_details.new(order_details_params)
  end
end
