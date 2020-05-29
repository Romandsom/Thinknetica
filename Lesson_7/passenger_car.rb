class PassengerCar
  extend InstanceCounter::ClassMethods
  include BrandNaming
  include Validate
  attr_reader :number, :free_seats, :filled_seats

  def initialize(number, free_seats)
    @number = number
    @free_seats = free_seats
    @filled_seats = 0
    validate!
  end

  def fill_seat
    if @free_seats > 0
      @free_seats -=1
      @filled_seats +=1
    else
      p 'The car is full'
    end
  end

  def show_free_seats
    p "There are #{self.free_seats} free seat(s) in the car"
  end

  def show_filled_seats
    p "There are #{self.filled_seats} filled seat(s) in the car"
  end

  protected

  def validate!
    raise "Car must have a number" if number.empty?
    raise "Number has invalid format, word characters in one word expected" if number !~ /^\w{1}*$/i
    raise "Number must consist of no more, than 15 word characters in one word" if number.length > 15
    raise "Car must have a certain amount of seats" if free_seats.empty?
    raise "Number of seats has invalid format, " if free_seats !~ /^\d{1}*$/i
    raise "Number of seats can not be more, the 110" if free_seats.to_i > 110
    true
    true
  end
end
