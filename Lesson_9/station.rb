# frozen_string_literal: true

class Station
  extend Accessors
  include InstanceCounter
  include Validate
  attr_reader :station_name, :station_trains

  class << self
    attr_accessor :station_roster
  end
  @station_roster = []

  def self.all
    @station_roster
  end

  def initialize(station_name)
    @station_name = station_name.capitalize
    @station_trains = []
    self.class.station_roster << self
    register_instance
    validate!
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

  protected

  def validate!
    raise 'Station must have a name' if station_name.empty?
    raise 'Station name must consist of word characters, in one word' if station_name !~ /^\w{1}*$/i
    raise 'Station name must consist of no more, than 15 word characters in one word' if station_name.length > 15

    true
  end
end
