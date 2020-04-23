puts 'What is your name?'
name = gets.chomp
puts 'What is your height?'
height = gets.chomp.to_f
ideal_weight = (height - 110) * 1.15
if ideal_weight < 0
  puts 'Your weight is perfect'
else
  puts "Your perfect weight is #{ideal_weight}, #{name}"
end
