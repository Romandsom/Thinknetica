
class Station
  include InstanceCounter
  include Validate
  attr_reader :station_name, :station_trains
  @@station_roster = []

  def initialize(station_name)
    @station_name = station_name
    @station_trains = []
    @@station_roster << self
    register_instance
    validate!
  end

  def self.all
    @@station_roster
  end

  def support_for_report(support_array)
    support_array.each do |trains|
      p trains.number
    end
  end

  #protected
  #если делаю эти два метода "protected", то программа перестает работать, почему?

  def train_leaving(train)
    @station_trains.delete(train)
    @@station_roster.delete(self)
  end

  def train_arriving(train)
    @station_trains << train
    @@station_roster << self
  end

  def trains_to_block
    train_block = Proc.new do
      |train|
      if train.is_a?(CargoTrain)
        type = 'cargo'
      else
        type = 'passenger'
      end
      p "Train ##{train.number} is a #{type} train, it has #{train.train_cars.count} cars"
      train.cars_to_block
    end
    @station_trains.each { |train| train_block.call(train) }
  end

  protected

  def validate!
    raise "Station must have a name" if station_name.empty?
    raise "Station name must consist of word characters, in one word" if station_name !~ /^\w{1}*$/i
    raise "Station name must consist of no more, than 15 word characters in one word" if station_name.length > 15
    true
  end
end
