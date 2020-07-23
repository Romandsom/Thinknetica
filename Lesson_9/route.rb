# frozen_string_literal: true

class Route
  extend Accessors
  include InstanceCounter

  attr_accessor_with_history :route
  attr_reader :route

  def initialize(first_station, last_station)
    @route = [first_station, last_station]
    register_instance
  end

  def add_station(station)
    @route.insert(-2, station)
  end

  def delete_station(station)
    @route.delete(station)
  end

  def route_report
    @route.each(&:station_name)
  end
end
