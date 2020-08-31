class Suppliers::RegistrationsController < Devise::RegistrationsController
  before_action :configure_supplier_permitted_parameters, if: :devise_controller?
  
  protected

  def configure_supplier_permitted_parameters
    supplier_added_attrs = [ :email, :name, :password, :password_confirmation , :telephone, :website, :pic]
    devise_parameter_sanitizer.permit :sign_up, keys: supplier_added_attrs
  end
end
