puts 'пожалуйста, введите первую сторону треугольника'
side_1 = gets.chomp.to_f
puts 'пожалуйста, введите вторую сторону треугольника'
side_2 = gets.chomp.to_f
puts 'пожалуйста, введите третью сторону треугольника'
side_3 = gets.chomp.to_f
sides = [side_1, side_2, side_3].sort!
if sides[2]**2 == sides[0]**2 + sides[1]**2
  straight = ', при этом он прямоугольный'
end
if side_1 == side_2 && side_1 == side_3 && side_2 == side_3
  puts 'данный треугольник равносторнний'
elsif side_1 == side_2 || side_1 == side_3 || side_2 == side_3
  puts "данный треугольник равнобедренный#{straight}"
else
  puts "данный треугольник ни равносторнний, ни равнобедренный#{straight}"
end
