array = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
puts 'пожалуйста, введите число'
day = gets.chomp.to_i
puts 'пожалуйста, введите месяц'
month = gets.chomp.to_i
puts 'пожалуйста, введите год'
year = gets.chomp.to_i
if year % 4 != 0 && year % 400 != 0
  ordinary = true
elsif year % 100 == 0 && year % 400 != 0
  ordinary = true
end
if ordinary != true
  array.map! { |m|
    if m == 28
      29
    else
      m
    end
  }
end
n = day + array.take(month).inject(0){ |sum, x| sum + x }
p n
