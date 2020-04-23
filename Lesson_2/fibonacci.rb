fibonacci = [0, 1]
while (sum = fibonacci[-1] + fibonacci[-2]) < 100
  fibonacci << sum
end
p fibonacci
