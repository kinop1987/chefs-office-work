class Form::Product < Product
  REGISTRABLE_ATTRIBUTES = %i(register  name  price unit )
  attr_accessor :register
end