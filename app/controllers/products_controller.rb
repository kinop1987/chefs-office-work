class ProductsController < ApplicationController
  before_action :require_login_supplier
  before_action :set_product, only: [:edit, :update, :destroy, :index]


  def index
      @supplier = Supplier.find(params[:supplier_id])
      @products = @supplier.products

  end

  def new
    @supplier = Supplier.find(params[:supplier_id])
    @form = Form::ProductCollection.new
  end

  

  def create
    @form = Form::ProductCollection.new(product_collection_params)
    @form.save
    redirect_to supplier_products_path,success: "商品を登録しました。"
  end

  def edit
  end

  def update
    if @product.update(update_product_params)
      redirect_to supplier_products_path, info: "商品を編集しました"
    else
      render action: :edit
    end 
  end

  def destroy
    @product.destroy
    redirect_to supplier_products_path, danger: "商品を削除しました"
  end
  
  private

  def product_collection_params
    params
      .require(:form_product_collection).permit(products_attributes: [:name, :price, :unit,:availability,:supplier_id])
  end

  def require_login_supplier
    unless logged_in_supplier?
      redirect_to  new_supplier_session_path, danger: "ログインしてください"
    end
  end

  def logged_in_supplier?
    !current_supplier.nil?
  end

  def set_product
    @product = Product.find_by(id: params[:id])
  end

  def update_product_params
    params.require(:product).permit(:name, :price, :unit)
  end

end