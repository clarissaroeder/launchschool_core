# Problem: turn a signed integer into a string
# Input: positive integer
  # Output: string representation of that integer
  # No built-in conversion methods (#to_s, String(), #format etc.)
  # IMPLICIT:
  # A negative number has a '-' in the output
  # A positive number without an explicit '+' should have + in the output
  # 0 is unsigned

STRINGS = {
    0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4',
    5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9'
  } 

def integer_to_string(num)
  result = ''
  num.digits.reverse.each { |n| result << STRINGS[n]}
  result
end

def signed_integer_to_string(num)
  result = integer_to_string(num.abs)
  case num <=> 0
  when -1 then "-" + result
  when +1 then "+" + result
  else result
  end
end

# Examples:
p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'

# Data Structures: conversion hash, array of digits
# Algorithm:
  # 1. Convert absolute value of num into string using integer_to_string and save in a result variable
  # 2. If statement: 
    # if num is smaller than 0, prepend - to result
    # if num is larger than 0, prepend + to result
  # 3. Return result
