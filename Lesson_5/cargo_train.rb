class CargoTrain < Train

  def attach_car(car)
    if car.class == CargoCar
      super
    else
      p 'Wrong type of car'
    end
  end
end
