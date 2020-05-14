class CargoCar
  extend InstanceCounter::ClassMethods
  include BrandNaming
  attr_reader :type_of_car, :number

  def initialize(number)
    @number = number
    @type_of_car = 'cargo'
  end
end
