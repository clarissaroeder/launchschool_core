# Problem: convert a number to a string
  # Input: positive integer
  # Output: string representation of that integer
  # No built-in conversion methods (#to_s, String(), #format etc.)
  # ?? Is #join allowed?

STRINGS = {
    0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4',
    5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9'
  } 

def integer_to_string(num)
  result = ''
  num.digits.reverse.each { |n| result << STRINGS[n]}
  result
end


# Examples:
p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

# Data Structures: array of digits, conversion hash constant (key = digit, value = letter)
# Algorithm:
  # 1. Define constant hash
  # 2. Define empty result string
  # 3. Turn integer into array of digits (#digits.reverse)
  # 4. Iterate over each element
      # 5. Append the corresponding value in the conversion hash to the result string
  # 6. Return result