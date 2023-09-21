=begin
Write a method that takes a string, and returns a new string in which every character is doubled.

ALGORITHM:
- Define an empty result string
- Iterate over characters in input string:
  - Append each character times two to result
- return result
=end

def repeater(string)
  result = ''
  string.each_char { |c| result << c * 2}
  result
end

# Examples:
p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''