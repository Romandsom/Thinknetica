# frozen_string_literal: true

class PassengerTrain < Train
  @train_roster = {}
  def attach_car(car)
    if car.class == PassengerCar
      super
    else
      p 'Wrong type of car'
    end
  end
end
