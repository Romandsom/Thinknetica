class PassengerCar
  extend InstanceCounter::ClassMethods
  include BrandNaming
  attr_reader :type_of_car, :number
  @@passengercars_roster = []

  def initialize(number)
    @number = number
    @type_of_car = 'passenger'
    @@passengercars_roster << self
  end
end
