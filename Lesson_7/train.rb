class Train
  include InstanceCounter
  include BrandNaming
  include Validate
  attr_accessor :speed
  attr_reader :train_cars, :current_station, :train_route, :number
  @@train_roster = {}

  NUMBER_FORMAT = /^[\w]{3}-*[\w]{2}$/i

  def self.find(train_number)
    @@train_roster[train_number]
  end

  def initialize(speed = 0,number)
    @speed = speed
    @number = number
    @train_cars = []
    @@train_roster[@number] = self
    register_instance
    validate!
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
    if @speed == 0
     @train_cars.delete(car)
    end
  end

  def train_route_report
    @prevous_station = @train_route.route[@train_route.route.index(@current_station)-1]
    @next_station = @train_route.route[@train_route.route.index(@current_station)+1]
    "Current station is - #{@current_station.station_name}, prevous_station is - #{@prevous_station.station_name}, next station is - #{@next_station.station_name} "
  end

  def each_wagon(&block)
    @train_cars.each { |car| block.call(car) }
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

  def validate!
    raise 'Train type must be passenger or cargo' unless self.is_a?(PassengerTrain)||self.is_a?(CargoTrain)
    raise "Train must have a number" if number.empty?
    raise "Number has invalid format. ***-** or ***** expected" if number !~ NUMBER_FORMAT
    true
  end
end
