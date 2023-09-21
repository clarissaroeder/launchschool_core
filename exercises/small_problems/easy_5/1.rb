# Problem: Write a method that determines and returns the ASCII string value of a string that is passed in as an argument (= the sum of all ASCII values)
  # Input: string     Output: integer
  # Explicit: you may use #ord
  # Do whitespaces count??

def ascii_value(string)
  result = 0
  string.each_char { |c| result += c.ord }
  result
end


# Examples:
p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

# Data Structure: character array for #ord method (takes single character strings)
# Algorithm:
  # 1. Define result variable and initialise to 0
  # 2. Iterate over each character in the string:
    # 3. On each element, apply #ord to determine ASCII value and add that value to result
  # 4. Return result