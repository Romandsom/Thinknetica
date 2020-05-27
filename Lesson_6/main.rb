require_relative 'module_brand'
require_relative 'instance_counter'
require_relative 'validate'
require_relative 'train'
require_relative 'passenger_car'
require_relative 'cargo_car'
require_relative 'cargo_train'
require_relative 'passneger_train'
require_relative 'route'
require_relative 'station'
require_relative 'aggregator'

c = Aggregator.new
s=Station.new('a')
s1=Station.new('b')
Station.instances_score
c1=CargoCar.new('009')
ct = CargoTrain.new('09000')
ct1 = CargoTrain.new('08000')
ct2 = CargoTrain.new('07000')
ct3 = CargoTrain.new('05000')
CargoTrain.instances_score
cpt2 = PassengerCar.new('udrdmn')
ctp3 = PassengerCar.new('urddddmn')
cta = PassengerTrain.new('100-e0')
cta1 = PassengerTrain.new('200-w0')
cta2 = PassengerTrain.new('300-0q')
cta3 = PassengerTrain.new('400-0q')
cta3 = PassengerTrain.new('50a-00')
PassengerTrain.instances_score
sqs=Route.new(s,s1)
s1d=Route.new(s1,s)
Route.instances_score
CargoTrain.find('07')
Station.all

loop do
  puts %Q(
  Choose your action:
  1. Create station
  2. Create train
  3. Create car
  4. Create route
  5. Add station to the route
  6. Delete station from the route
  7. Assign the train to the route
  8. Attach the car to the train
  9. Detach the car from the train
  10. Move the train forward along the route
  11. Move the train back along the route
  12. Get stations roster whith the the trains parked
  0.  Exit)
  action = gets.chomp
  case action.to_i
  when 1
    c.new_station
  when 2
    c.new_train
  when 3
    c.new_car
  when 4
    c.new_route
  when 5
    c.add_station
  when 6
    c.delete_station
  when 7
    c.train_on_route
  when 8
    c.attach_car
  when 9
    c.detach_car
  when 10
    c.move_forvard
  when 11
    c.move_back
  when 12
    c.aggregator_report
  when 0
    break
  else
    p "Error: there are 12 actions avaliable, #{action} is out of range  "
  end
end
