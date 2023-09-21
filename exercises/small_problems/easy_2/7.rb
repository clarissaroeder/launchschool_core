# Print all even numbers from 1 to 99, inclusive, to the console, with each number on a separate line.

arr = (1..99).to_a

even_arr = arr.select {|n| n.even?}
puts even_arr