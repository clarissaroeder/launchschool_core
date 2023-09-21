# Problem: Write a method that takes a string argument and returns a new string that contains the value of 
# the original string with all consecutive duplicate characters collapsed into a single character.
# You may not use #squeeze or #squeeze!
# Input: string     Output: string --> ?? same string ?? 

def crunch(string)
  result = []
  string.each_char { |c| result << c unless result.last == c }
  result.join
end

# Examples:
p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''

# Algorithm:
# 1. Initialise empty result array
# 2. Iterate over input string
  # 3. Append each character to the result string, unless the last element is the same as the current character
# 4. Join result array together to a string
# 5. Return result 