# frozen_string_literal: true

class Car
  include InstanceCounter
  include BrandNaming
  include Validation
  attr_reader :number, :total_places, :place_name, :filled_places
  validate :total_places, :presence
  validate :total_places, :type, Integer

  class << self
    attr_accessor :place_name, :place_limit
  end
  @place_name = 'place'
  @place_limit = 50

  def initialize(number, total_places)
    @number = number
    @total_places = total_places.to_i
    validate!
    @filled_places = 0
  end

  def fill_place(quantity_place)
    if (@total_places - @filled_places) >= quantity_place.to_i
      @filled_places += quantity_place.to_i
    else
      p 'The car is full or there is not enough place for another '\
      "passenger/cargo, there are #{show_free_place} "\
      " free #{self.class.place_name}"
    end
  end

  def show_free_place
    @total_places - @filled_places
  end

  def show_filled_place
    @filled_places
  end

  protected

  def validate!
    super
    raise 'Number must consist of no more, than 15 word characters in one word' if number.length > 15
    if @total_places > self.class.place_limit
      raise "Number of places can not be more, than #{self.class.place_limit} #{self.class.place_name}"
    end
  end
end
