class Train
  attr_accessor :speed
  attr_reader :number_of_cars, :current_station, :train_route, :number, :type

  def initialize(speed = 0,number,type,number_of_cars)  
    @type = type
    @speed = speed
    @number = number
    @number_of_cars = number_of_cars    
  end

  def stop
    self.speed = 0
  end

  def attach_car
    if @speed == 0
     @number_of_cars +=1
    end
  end

  def detach_car
    if @speed == 0
     @number_of_cars -=1
    end
  end

  def set_route(route)
    @train_route = route    
    @current_station = @train_route.route.first
    @current_station.train_arriving(self)
  end 

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

  def next_station
    @moving_instance = 1
    self.new_station
  end

  def prevous_station
    @moving_instance = -1
    self.new_station
  end

  def train_route_report
    @prevous_station = @train_route.route[@train_route.route.index(@current_station)-1]
    @next_station = @train_route.route[@train_route.route.index(@current_station)+1]
    "Current station is - #{@current_station.station_name}, prevous_station is - #{@prevous_station.station_name}, next station is - #{@next_station.station_name} "
  end
end
