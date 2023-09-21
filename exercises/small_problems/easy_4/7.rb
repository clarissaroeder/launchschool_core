# Problem: Write a method that takes a String of digits, and returns the appropriate number as an integer. 
    # Input: String       Output: Integer
    # You may not use String#to_i or Integer(), or any other standard conversion methods. You should analyse the string character by character.
    # Do not worry about leading - or + signs.
    # You may assume all characters will be numeric.
    
def string_to_integer(string)
  result = 0
  place = 1
  string.reverse.each_char do |char|
    buffer = case char
             when '0' then 0
             when '1' then 1
             when '2' then 2
             when '3' then 3
             when '4' then 4
             when '5' then 5
             when '6' then 6
             when '7' then 7
             when '8' then 8
             when '9' then 9
             end
    
    buffer *= place
    result += buffer
    place *= 10
  end
  result
end

# Examples:
p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

# Data Structures: array of characters?

# Algorithm:
  # 1. Create result variable and set to 0
  # 2. Create a place variable and set to 1
  # 3. Reverse the string
  # 4. Iterate over each character in the string
    # 5. Case statement: assign an integer based on which character it is to a buffer variable
    # 6. Multiply buffer by place and add that to result
    # 7. Mulitply place by 10
  # 8. Return result
