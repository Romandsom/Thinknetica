# frozen_string_literal: true

class Station
  extend Accessors
  include InstanceCounter
  include Validation
  attr_accessor_with_history :station_trains
  attr_reader :station_name, :station_trains

  class << self
    attr_accessor :station_roster
  end
  @station_roster = []

  validate :station_name, :presence
  validate :station_name, :type, String

  def self.all
    @station_roster
  end

  def initialize(station_name)
    @station_name = station_name.capitalize
    @station_trains = []
    self.class.station_roster << self
    validate!
    register_instance
  end

  def support_for_report(support_array)
    support_array.each do |trains|
      p trains.number
    end
  end

  def train_leaving(train)
    @station_trains.delete(train)
    self.class.station_roster.delete(self)
  end

  def train_arriving(train)
    @station_trains << train
    self.class.station_roster << self
  end

  def each_train(&block)
    @station_trains.each { |train| block.call(train) }
  end
end
