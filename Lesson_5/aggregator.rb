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
    p 'Choose the first station of new route:'
    number_first = select_station
    @routes << Route.new(number_first, nil)
    p 'Choose the last station of new route:'
    number_last = select_station
    @routes.last.route[-1] = number_last
  end

  def add_station
    puts 'Choose the route to add the station'
    subject_route = select_route
    p 'Choose the station to add:'
    station_number = select_station
    subject_route.add_station(station_number)
  end

  def delete_station
    puts 'Choose the route to delete the station'
    subject_route = select_route
    p 'Choose the station to delete:'
    station_number = select_station
    subject_route.delete_station(station_number)
  end

  def train_on_route
    puts 'Choose the train to set on the route'
    @subject_train = select_train
    puts 'Choose the route to set'
    subject_route = select_route
    @subject_train.set_route(subject_route)
  end

    def attach_car
      puts 'Choose the train to attach a car'
      @subject_train = select_train
      if @subject_train.speed != 0
        p 'Train is on the route. It should be stopped to attach a car'
      else
        if @subject_train.class == CargoTrain
          car_array = @cargo_cars
        elsif @subject_train.class == PassengerTrain
          car_array = @passenger_cars
        end
        inner_method_attach(car_array)
      end
    end

  def detach_car
    puts 'Choose the train to detach a car'
    @subject_train = select_train
    if @subject_train.speed != 0
      p 'Train is on the route. It should be stopped to detach a car'
    else
      puts 'Choose the car to detach'
      @subject_train.train_cars.each do |car|
        p "#{(@subject_train.train_cars.index(car)+1)}. #{car.number}"
      end
      number_of_car = gets.chomp.to_i
      @subject_train.train_cars.delete(@subject_train.train_cars[number_of_car - 1])
    end
  end

  def move_forvard
    puts 'Choose the train to move forvard along the train'
    @subject_train = select_train
    @subject_train.next_station
  end

  def move_back
    puts 'Choose the train to move back along the train'
    @subject_train = select_train
    @subject_train.prevous_station
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

  protected

  #Вспомогательные методы

  def inner_method_attach(car_array)
    puts 'Choose the car to attach'
    car_array.each do |car|
      p "#{(car_array.index(car)+1)}. #{car.number}"
    end
    number_of_car = gets.chomp.to_i
    @subject_train.attach_car(car_array[number_of_car - 1])
  end

  def support_for_report(support_array)
    support_array.each do |trains|
      p trains.number
    end
  end

  def select_route
    @routes.each.with_index(1) do |support_route, index|
      p "#{support_for_routes(support_route.route)} press #{index}"
    end
    number_of_route = gets.chomp.to_i
    @routes[number_of_route - 1]
  end

  def support_for_routes(sup_route)
    sup_route.each do |station|
      print "#{station.station_name} - "
    end
    return nil
  end

  def show_trains
    @trains.each.with_index(1) do |train, index|
      puts "#{index}. #{train.number}"
    end
  end

  def select_train
    show_trains
    number_of_train = gets.chomp.to_i
    @trains[number_of_train - 1]
  end

  def select_station
    @stations.each do |station|
      p "#{(@stations.index(station)+1)}. #{station.station_name}"
    end
    station_number = gets.chomp.to_i
    @stations[station_number - 1]
  end
end
