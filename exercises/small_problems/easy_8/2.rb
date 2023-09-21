=begin
Write a method that returns a list of all substrings of a string that start at the beginning of the original string. 
The return value should be arranged in order from shortest to longest substring.

- Define result array
- Loop as many times as there are elements in the character array
  - Slice character array from index 0, with length of current count
  - Add to result array
- return result
=end

def leading_substrings(string)
  result = []
  1.upto(string.size) { |count| result << string[0, count] }

  result
end

# Examples:
p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']