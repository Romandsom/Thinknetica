class PassengerTrain < Train

  def attach_car(car)
    if car.class == PassengerCar
      super
    else
      p 'Wrong type of car'
    end
  end

end
