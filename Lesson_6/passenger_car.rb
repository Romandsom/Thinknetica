class PassengerCar
  extend InstanceCounter::ClassMethods
  include BrandNaming
  include Validate
  attr_reader :type_of_car, :number

  def initialize(number)
    @number = number
    @type_of_car = 'passenger'
    validate!
  end

  def validate!
    raise "Car must have a number" if number.empty?
    raise "Number has invalid format, word characters in one word expected" if number !~ /^\w{1}*$/i
    raise "Number must consist of no more, than 15 word characters in one word" if number.length > 15
    true
  end
end
