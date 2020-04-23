class Train
  attr_accessor :speed
  attr_reader :type, :train_cars, :current_station, :train_route, :number

  def train_type
    @type = 'base'
  end

  def initialize(speed = 0,number)
    @speed = speed
    @number = number
    @train_cars = []
    self.train_type
  end

  def stop
    self.speed = 0
  end

  def set_route(route)
    @train_route = route
    @current_station = route.route[0]
    @current_station.train_arriving(self)
  end

  def next_station
    @moving_instance = 1
    self.new_station
  end

  def prevous_station
    @moving_instance = -1
    self.new_station
  end

  def attach_car(car)
    if @speed == 0
     @train_cars << car
    end
  end

  def detach_car(car)
    if @speed == 0 && @type == car.type_of_car
     @train_cars.delete(car)
    end
  end

  def train_route_report
    @prevous_station = @train_route.route[@train_route.route.index(@current_station)-1]
    @next_station = @train_route.route[@train_route.route.index(@current_station)+1]
    "Current station is - #{@current_station.station_name}, prevous_station is - #{@prevous_station.station_name}, next station is - #{@next_station.station_name} "
  end

  protected

  # Bнутренний метод, клиетский код должен не иметь доступ к нему, подклассы должны наследовать этот метод, self применяется и потому protected, а не private

  def new_station
    @train_route.route.each do |name_of_station|
      if @current_station == name_of_station
        @current_station.train_leaving(self)
        @new_station = @train_route.route[@train_route.route.index(name_of_station) + @moving_instance]
        @new_station.train_arriving(self)
      end
    end
    @current_station = @new_station
  end
end
