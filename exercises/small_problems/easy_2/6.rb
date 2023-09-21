# Print all odd numbers from 1 to 99, inclusive, to the console, with each number on a separate line.

arr = (1..99).to_a

arr.each { |n| if n.odd? then puts n end} 
  