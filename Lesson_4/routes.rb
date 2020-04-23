class Route
  attr_reader :route

  def initialize(first_station, last_station)
    @route = [first_station, last_station]
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
