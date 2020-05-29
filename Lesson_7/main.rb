require_relative 'module_brand'
require_relative 'instance_counter'
require_relative 'validate'
require_relative 'aggregator'
require_relative 'train'
require_relative 'passenger_car'
require_relative 'cargo_car'
require_relative 'cargo_train'
require_relative 'passneger_train'
require_relative 'route'
require_relative 'station'

# c = Aggregator.new
# c.trains << PassengerTrain.new('11111')
# c.trains << PassengerTrain.new('22222')
# c.trains << PassengerTrain.new('33333')
# c.trains << CargoTrain.new('44444')
# c.trains << CargoTrain.new('55555')
# a = Station.new('a')
# cx = Station.new('b')
# ccs = Station.new('c')
# g = Station.new('d')
# c.stations << a
# c.stations << cx
# c.stations << ccs
# c.stations << g
# ssd = PassengerCar.new('zzz', '12')
# gh = CargoCar.new('ssa', '30')
# vv= PassengerCar.new('yyy', '15')
# ff= CargoCar.new('esa', '31')
# jj= PassengerCar.new('ttt', '100')
# uu= CargoCar.new('susa', '20')
# ty = Route.new(a,cx)
# er =Route.new(cx,a)
# we =Route.new(ccs,a)
# qw =Route.new(g,cx)
# c.routes << ty
# c.routes << er
# c.routes << we
# c.routes << qw
# c.trains[0].attach_car(ssd)
# c.trains[0].attach_car(vv)
# c.trains[0].attach_car(jj)
# c.trains[3].set_route(we)
# c.trains[0].set_route(qw)
# c.trains[3].attach_car(uu)
# c.trains[3].attach_car(ff)

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
  12. Get railroad report
  13. Fill a place in the car
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
  when 13
    c.fill_place
  when 0
    break
  else
    p "Error: there are 13 actions avaliable, #{action} is out of range  "
  end
end
