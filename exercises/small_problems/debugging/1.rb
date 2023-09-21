def decrease(counter)
  counter -= 1
end

counter = 10

loop do
  puts counter
  counter = decrease(counter)
  break if counter == 0
end

puts 'LAUNCH!'