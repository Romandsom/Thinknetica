class CargoCar
  extend InstanceCounter::ClassMethods
  include BrandNaming
  include Validate
  attr_reader :number, :free_pallets, :filled_pallets

  def initialize(number, free_pallets)
    @number = number
    @free_pallets = free_pallets
    @filled_pallets = 0
    validate!
  end

  def fill_pallet
    if @free_pallets > 0
      @free_pallets -=1
      @filled_pallets += 1
    else
      p 'The car is full'
    end
  end

  def show_free_pallets
    p "There are #{self.free_pallets} free pallet(s) in the car"
  end

  def show_filled_pallets
    p "There are #{self.filled_pallets} filled pallet(s) in the car"
  end

  protected

  def validate!
    raise "Car must have a number" if number.empty?
    raise "Number has invalid format, word characters in one word expected" if number !~ /^\w{1}*$/i
    raise "Number must consist of no more, than 15 word characters in one word" if number.length > 15
    raise "Number of pallets has invalid format, " if free_pallets !~ /^\d{1}*$/i
    raise "Number of pallets can not be more, the 110" if free_pallets.to_i > 33
    true
  end
end
