class OrdersTablesController < ApplicationController
  before_action :set_supplier_login

  def index
  end

  def new 
    @orders_table = OrdersTable.new
    order = @orders_table.orders.build
  end

  def create
    @orders_table = OrdersTable.create(orders_table_params)
    if @orders_table.save
      redirect_to "/suppliers/#{current_supplier.id}/orders_tables"
    end
  end


  private

  def orders_table_params
    params.require(:orders_table).permit(orders_attributes: [:id,:name,:price,:unit] ).merge(supplier_id: current_supplier.id)
  end

  def set_supplier_login
    @supplier = Supplier.find(params[:supplier_id])
  end

end
