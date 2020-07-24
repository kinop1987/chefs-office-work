class OrdersController < ApplicationController

  def index
    @suppliers = Supplier.all
    @user = User.find(params[:user_id])
  end

  def new
    @supplier = Supplier.find(params[:supplier_id])
    @product = @supplier.products
    @user = User.find(params[:user_id])
    @order = @user.orders.new
    @order.order_details.build
  end

  def create
    @order = Order.new(order_params)
  end

  def order_params
    params.require(:order).(:price, order_detail_attributes[:id])
  end


end
