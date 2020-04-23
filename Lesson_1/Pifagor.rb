puts 'пожалуйста, введите первую сторону треугольника'
side_1 = gets.chomp.to_f
puts 'пожалуйста, введите вторую сторону треугольника'
side_2 = gets.chomp.to_f
puts 'пожалуйста, введите третью сторону треугольника'
side_3 = gets.chomp.to_f
if side_1 > side_2 && side_1 > side_3
  check = side_1**2 - side_2**2 - side_3**2  
elsif side_2 > side_1 && side_2 > side_3
  check = side_2**2 - side_1**2 - side_3**2 
else side_3 > side_1 && side_3 > side_2
  check = side_3**2 - side_1**2 - side_2**2  
end
if check == 0
  straight = ', при этом он прямоугольный'
end
if side_1 == side_2 && side_1 == side_3 && side_2 == side_3
  puts 'данный треугольник равносторнний'
elsif side_1 == side_2 || side_1 == side_3 || side_2 == side_3
  puts "данный треугольник равнобедренный#{straight}"
else
  puts "данный треугольник ни равносторнний, ни равнобедренный#{straight}"
end
