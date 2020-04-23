class Aggregator
  attr_reader :trains, :stations, :routes, :passenger_cars, :cargo_cars

  def initialize
    @stations = []
    @trains = []
    @routes = []
    @passenger_cars = []
    @cargo_cars = []
  end

  def new_station
    p 'Enter the name of new station:'
    new_station_name = gets.chomp.to_s
    @stations << Station.new(new_station_name)
  end

  def new_train
    p 'Enter the type of new train(passenger or cargo):'
    type_of_train = gets.chomp
    if type_of_train == 'passenger' || type_of_train == 'cargo'
      p 'Enter the number of new train'
      number_of_train = gets.chomp
      if type_of_train == 'passenger'
        @trains << PassengerTrain.new(number_of_train)
      else
        type_of_train == 'cargo'
        @trains << CargoTrain.new(number_of_train)
      end
    else
      p 'Train type must be passenger or cargo'
    end
  end

  def new_car
    p 'Enter the type of new car(passenger or cargo):'
    type_of_car = gets.chomp
    if type_of_car == 'passenger' || type_of_car == 'cargo'
      p 'Enter the number of new car'
      number_of_car = gets.chomp
      if type_of_car == 'passenger'
        @passenger_cars << PassengerCar.new(number_of_car)
      elsif
        type_of_car == 'cargo'
        @cargo_cars << CargoCar.new(number_of_car)
      end
    else
      p 'Car type must be passenger or cargo'
    end
  end

  def new_route
    @stations.each do |station|
      p "#{(@stations.index(station)+1)}. #{station.station_name}"
    end
    p 'Choose the first station of new route:'
    number_first = gets.chomp.to_i
    @stations.each do |station|
      p "#{(@stations.index(station)+1)}. #{station.station_name}"
    end
    p 'Choose the last station of new route:'
    number_last = gets.chomp.to_i
    @routes << Route.new(@stations[number_first - 1], @stations[number_last- 1])
  end

  def add_station
    puts 'Choose the route to add the station'
    support_for_routes_base
    number_of_route = gets.chomp.to_i
    @stations.each do |station|
      p "#{(@stations.index(station)+1)}. #{station.station_name}"
    end
    p 'Choose the station to add:'
    station_number = gets.chomp.to_i
    @routes[number_of_route - 1].route.insert(-2, @stations[station_number - 1])
  end

  def delete_station
    puts 'Choose the route to delete the station'
    support_for_routes_base
    number_of_route = gets.chomp.to_i
    @stations.each do |station|
      p "#{(@stations.index(station)+1)}. #{station.station_name}"
    end
    p 'Choose the station to delete:'
    station_number = gets.chomp.to_i
    @routes[number_of_route - 1].route.delete(@stations[station_number - 1])
  end

  def train_on_route
    puts 'Choose the train to set on the route'
    select_train
    number_of_train = gets.chomp.to_i
    puts 'Choose the route to set'
    support_for_routes_base
    number_of_route = gets.chomp.to_i
    @trains[number_of_train - 1].set_route(@routes[number_of_route - 1])
  end

  def detach_car
    puts 'Choose the train to detach a car'
    select_train
    number_of_train = gets.chomp.to_i
    if @trains[@number_of_train - 1].speed != 0
      p 'Train is on the route. It should be stopped to detach a car'
    else
      puts 'Choose the car to detach'
      @trains[number_of_train - 1].train_cars.each do |car|
        p "#{(@trains[number_of_train - 1].train_cars.index(car)+1)}. #{car.number}"
      end
      number_of_car = gets.chomp.to_i
      @trains[number_of_train - 1].train_cars.delete(@trains[number_of_train - 1].train_cars[number_of_car - 1])
    end
  end

  def move_forvard
    puts 'Choose the train to move forvard along the train'
    select_train
    number_of_train = gets.chomp.to_i
    @trains[number_of_train - 1].next_station
  end

  def move_back
    puts 'Choose the train to move back along the train'
    select_train
    number_of_train = gets.chomp.to_i
    @trains[number_of_train - 1].prevous_station
  end

  def aggregator_report
    @stations.each do |station|
      if station.station_trains.empty? == true
        p "Station - #{station.station_name} has no trains"
      elsif station.station_trains.empty? == false
        p "Station - #{station.station_name} has trains numbered:"
        support_array = station.station_trains
        support_for_report(support_array)
      end
    end
  end

  def attach_car
    puts 'Choose the train to attach a car'
    select_train
    @number_of_train = gets.chomp.to_i
    if @trains[@number_of_train - 1].speed != 0
      p 'Train is on the route. It should be stopped to attach a car'
    else
      if @trains[@number_of_train - 1].class == CargoTrain
        car_array = @cargo_cars
      elsif @trains[@number_of_train - 1].class == PassengerTrain
        car_array = @passenger_cars
      end
      inner_method_attach(car_array)
    end
  end

  protected

  #Вспомогательные методы

  def inner_method_attach(car_array)
    puts 'Choose the car to attach'
    car_array.each do |car|
      p "#{(car_array.index(car)+1)}. #{car.number}"
    end
    number_of_car = gets.chomp.to_i
    @trains[@number_of_train - 1].attach_car(car_array[number_of_car - 1])
  end

  def support_for_report(support_array)
    support_array.each do |trains|
      p trains.number
    end
  end

  def support_for_routes_base
    @routes.each.with_index(1) do |support_route, index|
      p "#{support_for_routes(support_route.route)} press #{index}"
    end
  end

  def support_for_routes(sup_route)
    sup_route.each do |station|
      print "#{station.station_name} - "
    end
    return nil
  end

  def select_train
    @trains.each.with_index(1) do |train, index|
      p "#{index}. #{train.number}"
    end
  end
end
