class PassengerTrain < Train
  @@passengertrain_roster = []

  def initialize(speed = 0,number)
    @@passengertrain_roster << self
    super
  end

  def attach_car(car)
    if car.class == PassengerCar
      super
    else
      p 'Wrong type of car'
    end
  end
end
