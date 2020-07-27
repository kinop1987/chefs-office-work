class OrdersController < ApplicationController

  def index
    @suppliers = Supplier.all
    @user = User.find(params[:user_id])
  end

  def new
    @supplier = Supplier.find(params[:supplier_id])
    @products = @supplier.products
    @user = User.find(params[:user_id])
    @order = Order.new
    @order.order_details.build
    @order_details = @order.order_details
    

  end

  def create
    @supplier = Supplier.find(params[:supplier_id])
    @products = @supplier.products
    @order = Order.new(order_params)
    @order.order_details.new(order_details_params)
    if @order.save
      flash[:success] = '注文を完了しました！'
      redirect_to user_orders_path
    else
      render :new
    end
  end

  private

  def order_params
    params
      .require(:order).permit(:user_id,
                              :supplier_id,
                              :quantity)
  end

  def order_details_params
    params.require(:order_details).map do |param|
      ActionController::Parameters.new(param.to_unsafe_h).permit(:product_id, :order_id, :unit_price, :quantity)
    end
  end

end
