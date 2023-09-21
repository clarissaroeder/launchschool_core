=begin
Write a method that takes two arguments: the first is the starting number, and the second is the ending number. 
Print out all numbers from the starting number to the ending number, except if a number is divisible by 3, 
print "Fizz", if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

ALGORITHM:
- From start number up to end number, iterate:
  - If divisible by 3 and 5: print fizzbuzz
  - Else if divisible by 3: print fizz
  - Else if divisible by 5: print buzz
  - Else print number
=end

require 'pry'

def fizzbuzz(start_num, end_num)
  start_num.upto(end_num) do |num|
    if num % 3 == 0 && num % 5 == 0
      print 'FizzBuzz'
    elsif num % 3 == 0
      print 'Fizz'
    elsif num % 5 == 0
      print 'Buzz'
    else 
      print num
    end
    
    if num != end_num
      print(", ")
    else 
      puts ''
    end
  end
end


# Examples:
fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

