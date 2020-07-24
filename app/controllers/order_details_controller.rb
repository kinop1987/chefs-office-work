class OrderDetailsController < ApplicationController
  def new
    @order_detail = Form::OrderCollection.new
  end


  def create
    binding.pry
    @order_detail = Form::OrderCollection.new(order_collection_params)
    if @order_detail.save
      redirect_to user_orders_path
    else
      render :new
    end
  end

  private
    def order_params
      params.require(:form_order_collection)
      .permit(orders_attributes: :order_id, :product_id, :unit_price, :quantity, :price).merge(user_id: current_user.id)
    end
end
