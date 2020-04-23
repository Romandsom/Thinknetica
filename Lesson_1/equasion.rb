puts 'введите a'
a = gets.chomp.to_f
puts 'введите b'
b = gets.chomp.to_f
puts 'введите c'
c = gets.chomp.to_f
d = b**2 - 4*a*c
if d < 0
  puts "значениe дискриминанта #{d}, корней нет"
else 
  z = Math.sqrt(d)
  x1 = (- b - z) /2 /a
  x2 = (- b + z) /2 /a
end
if d > 0
  puts "значения дискриминанта и корней уравнения #{d}, #{x1}, #{x2}"
elsif d == 0
  puts "значение дискриминанта - ноль, корень уравнения равен #{x1}"
end
