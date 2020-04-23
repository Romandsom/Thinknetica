class Station  
  attr_reader :station_name, :station_trains
  @@station_roster = []

  def initialize(station_name)
    @station_name = station_name
    @station_trains = [] 
    @@station_roster << self   
    
  end  
  
  def self.station_report  
    @@station_roster.each do |station|
      if station.station_trains.count == 0
        p "Station - #{station.station_name} has no trains"
      else
        p "Station - #{station.station_name} has trains numbered:"
        station.station_trains.each do |trains|
          p trains.number
        end
      end
    end    
  end  

  def train_leaving(train)
    @station_trains.delete(train)
    @@station_roster.delete(self)
  end

  def train_arriving(train)
    @station_trains << train
    @@station_roster << self
  end  
end

s = Station.new('a')
s1 = Station.new('b')
s2 = Station.new('c')
s3 = Station.new('d')
r = Route.new(s,s3)
r.add_station(s1)
r.add_station(s2)
r.delete_station(s3)
t = Train.new(123, 'passenger', 4)
t1 = Train.new(456, 'cargo', 3)
t.set_route(r)
r.route_report
t.next_station
t.next_station
t.prevous_station
r1 = Route.new(s,s3)
t1.set_route(r1)
t.train_route_report
