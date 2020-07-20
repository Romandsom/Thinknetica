# frozen_string_literal: true

class CargoTrain < Train
  @train_roster = {}
  def attach_car(car)
    if car.class == CargoCar
      super
    else
      p 'Wrong type of car'
    end
  end
end
