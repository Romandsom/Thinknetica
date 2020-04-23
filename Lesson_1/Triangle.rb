puts 'пожалуйста, введите основание треугольника'
footing = gets.chomp.to_f
puts 'пожалуйста, введите высоту треугольника'
height = gets.chomp.to_f
triangle = footing * height/2
puts "Площадь треугольника равна #{triangle}"
