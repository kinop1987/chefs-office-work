class Form::Base
  include ActiveModel::Model
  include ActiveModel::Callbacks
  include ActiveModel::Validations
  include ActiveModel::Validations::Callbacks
  include ActiveModel::Attributes

  def cast_value(value)
    ActiveRecord::Type::Boolean.new.cast(value)
  end
end