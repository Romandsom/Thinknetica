
class Station
  include InstanceCounter
  attr_reader :station_name, :station_trains
  @@station_roster = []

  def initialize(station_name)
    @station_name = station_name
    @station_trains = []
    @@station_roster << self
  end

  def self.all
    p @@station_roster
  end

  def support_for_report(support_array)
    support_array.each do |trains|
      p trains.number
    end
  end

  #protected
  #если делаю эти два метода "protected", то программа перестает работать, почему?
  #нижеследующие 2 метода класса Station  - внутренние методы, должны работать автоматически и запускаться совместно - поезд должен и уехать и приехать на рядом расположенную станции. доступа клиентского кода к ним быть не должно, они запускаются с self(в классе Train), поэтому должны быть protected

  def train_leaving(train)
    @station_trains.delete(train)
    @@station_roster.delete(self)
  end

  def train_arriving(train)
    @station_trains << train
    @@station_roster << self
  end
end
