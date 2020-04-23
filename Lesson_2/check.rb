sub_array = []
total = {}
main_hash = {}
sku = ''
until sku.to_s == 'stop'
  puts 'введите наименование товара'
  sku = gets.chomp
  if sku == 'stop'
    puts ''
    puts main_hash
    puts ''
    puts 'Сумма по каждому продукту'
    puts ''
    total.each { |z,x| puts "#{z} - #{x}" }
    puts ''
    puts 'Итого в корзине'
    puts ''
    puts total.values.sum
  else
    puts 'введите цену товара'
    price = gets.chomp.to_f
    puts 'введите количество товара'
    quantity = gets.chomp.to_f
    sub_array.insert(0, price)
    sub_array.insert(1, quantity)
    main_hash[sku] = { sub_array[0] => sub_array[1] }
    total[sku] = price * quantity
  end
end
