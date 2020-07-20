# frozen_string_literal: true

class PassengerCar < Car
  @place_name = 'seat(s)'
  @place_limit = 110

  def fill_place(_quantity_place)
    super(1)
  end
end
