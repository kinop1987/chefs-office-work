class SuppliersController < ApplicationController
  before_action :authenticate_supplier!

  def edit
    @supplier = Supplier.find_by(id: current_supplier.id)
  end

  def update
    @supplier = Supplier.find_by(id: current_supplier.id)
    @supplier.update(supplier_params)
    redirect_to root_path success: "お客様情報を更新しました"
  end
  private
   def supplier_params
    params.require(:supplier).permit(:name, :email, :telephone, :website, :pic)
   end

end



