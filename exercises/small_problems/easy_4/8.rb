# # Problem: write a method that converts a numeric string into an integer
# # You may not use any built-in conversion methods (#to_i, Integer())
# # Your solution should handle signs (+, -)
#   # If no sign is given, return a positive integer
# # Assume the string will always contain a valid number
# # You may use your method from exercise 7

# DIGITS = {'0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9}

# def string_to_signed_integer(string)
#   sign = 1
#   result = 0
#   string.chars.each do |char|
#     if char == '-'
#       sign = -1
#       next
#     elsif char == '+'
#       next
#     else
#       result = result * 10 + DIGITS[char]
#     end
#   end
#   result * sign
# end

# # Examples:
# p string_to_signed_integer('4321') == 4321
# p string_to_signed_integer('-570') == -570
# p string_to_signed_integer('+100') == 100

# # Data Structures: digits conversion hash constant (letters = keys, digits = values), character array
# # Algorithm: 
#   # 1. Define digits conversion hash (constant)
#   # 2. Define sign variable and default to +1
#   # 3. Define a result variable and set to 0
#   # 5. Turn string into character array and iterate over each element
#   # 6. If statement: 
#         # if first character is '-', update sign variable to -1, next
#         # else if first character '+', next
#         # else procede as usual
#   # 7. Update value: the previous value times 10 plus the current element as found in the digits hash (result = result * 10 + DIGITS[char])
#   # 8. Multiply value by sign variable and return result

# Further Exploration: refactor this solution so string_to_integer and string[1..-1] are called only once each

DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }

  value = 0
  digits.each { |digit| value = 10 * value + digit }
  value
end

# def string_to_signed_integer(string)
#   case string[0]
#   when '-' then -string_to_integer(string[1..-1])
#   when '+' then string_to_integer(string[1..-1])
#   else          string_to_integer(string)
#   end
# end

def string_to_signed_integer(string)
  number = string_to_integer(string.delete('+-'))

  case string[0]
  when '-' then -number
  else number
  end
end


p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100