class CargoTrain < Train
  @@cargotrain_roster = []

  def initialize(speed = 0,number)
    @@cargotrain_roster << self
    super
  end

  def attach_car(car)
    if car.class == CargoCar
      super
    else
      p 'Wrong type of car'
    end
  end
end
