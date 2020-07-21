class ProductsController < ApplicationController
  before_action :require_login_supplier

  def index
  end

  def new
    @form = Form::ProductCollection.new
  end

  def create
    @form = Form::ProductCollection.new(product_collection_params)
    if @form.save
      redirect_to root_path, notice: "#{@form.target_products.size}件の商品を登録しました。"
    else
      render root_path, notice: "商品の登録に失敗しました"

    end
  end

  private

  def product_collection_params
    params
      .require(:form_product_collection)
      .permit(products_attributes: Form::Product::REGISTRABLE_ATTRIBUTES).merge(supplier_id: current_supplier.id)
  end

  def require_login_supplier
    unless logged_in_supplier?
      flash[:danger] = "ログインしてください"
      redirect_to  new_supplier_session_path
    end
  end

  def logged_in_supplier?
    !current_supplier.nil?
  end
end