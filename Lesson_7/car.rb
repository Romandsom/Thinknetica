class Car
  class << self
    attr_accessor :place_name, :place_limit
  end
  @place_name = 'place'
  @place_limit = 50
  extend InstanceCounter::ClassMethods
  include BrandNaming
  include Validate
  attr_reader :number, :total_places, :car_array, :place_name

  def initialize(number, total_places)
    @number = number
    @total_places = total_places.to_i
    validate!
    @car_array = []
    @car_array << @total_places
    filled_places = 0
    @car_array << filled_places
    p self.class.place_name
    p self.class.place_limit
  end

  def fill_place

    if (@car_array[0] - @car_array[1]) > 0
      @car_array[1] +=1
    else
      p 'The car is full'
    end
  end

  def show_free_place
    p "There are #{self.car_array[0] - self.car_array[1]} free #{self.class.place_name} in the car"
  end

  def show_filled_place
    p "There are #{self.car_array[1]} filled #{@v} in the car"
  end

  protected

  def validate!
    raise "Car must have a number" if number.empty?
    raise "Number has invalid format, word characters in one word expected" if number !~ /^\w{1}*$/i
    raise "Number must consist of no more, than 15 word characters in one word" if number.length > 15
    raise "Number of places can not be more, than #{self.class.place_limit}" if @total_places > self.class.place_limit
  end
end
