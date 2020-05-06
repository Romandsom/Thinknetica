class Route
  include InstanceCounter
  attr_reader :route
  @@routes_roster = []

  def initialize(first_station, last_station)
    @route = [first_station, last_station]
    @@routes_roster << self
  end

  def add_station(station)
    @route.insert(-2,station)
  end

  def delete_station(station)
    @route.delete(station)
  end

  def route_report
    @route.each do |stations|
      p stations.station_name
    end
  end
end
