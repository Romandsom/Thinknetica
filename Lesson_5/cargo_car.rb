class CargoCar
  extend InstanceCounter::ClassMethods
  include BrandNaming
  attr_reader :type_of_car, :number
  @@cargocar_roster = []

  def initialize(number)
    @number = number
    @type_of_car = 'cargo'
    @@cargocar_roster << self
  end
end
