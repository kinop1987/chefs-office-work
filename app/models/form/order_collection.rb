class Form::MemoCollection < Form::Base
  @supplier = Supplier.find(params[:supplier_id])
  @products = @suppier.products
  FORM_COUNT = @products[:id].count
  attr_accessor :order_details

  def initialize(attributes = {})
    super attributes
    self.order_details = FORM_COUNT.times.map { OrederDetail.new() } unless self.order_details.present?
  end
  
  def order_attributes=(attributes)
    self.order_details = attributes.map { |_, v| Memo.new(v) }
  end

  def save
    OrederDetail.transaction do
      self.order_details.map(&:save!)
    end
      return true
    rescue => e
      return false
  end
end