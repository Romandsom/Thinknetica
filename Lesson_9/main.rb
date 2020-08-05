# frozen_string_literal: true

require_relative 'accesors'
require_relative 'module_brand'
require_relative 'instance_counter'
require_relative 'validation'
require_relative 'aggregator'
require_relative 'train'
require_relative 'car'
require_relative 'passenger_car'
require_relative 'cargo_car'
require_relative 'cargo_train'
require_relative 'passneger_train'
require_relative 'route'
require_relative 'station'

c = Aggregator.new

loop do
  puts %(
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
