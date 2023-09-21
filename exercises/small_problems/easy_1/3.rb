# Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, 
# always starting with 1. The length of the string should match the given integer.

def stringy1(num)
  string = ''
  while num > 0
    string += '1'
    num -= 1
    if num > 0
      string += '0'
      num -= 1
    end
  end
  string
end
    
def stringy(size, start=1)
  numbers = []

  if start == 1
    size.times do |index|
      number = index.even? ? 1 : 0
      numbers << number
    end
  else
    size.times do |index|
      number = index.even? ? 0 : 1
      numbers << number
    end
  end

  numbers.join
end

puts stringy(6)
puts stringy(6, 0)