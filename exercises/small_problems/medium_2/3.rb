=begin
---------------
PROBLEM
---------------
Restate: Write a method that, given a string, returns a hash with three entries consisting of the percentages (!) 
of characters in the string that are lowercase, uppercase, or neither (percentages -> values)

Input: String
Output: Hash
Rules: Assume the string has at least 1 character.

EXAMPLE
---------------
'abCdef 123' -> lowercase: 50.0, uppercase: 10.0, neither: 40.0 
10 characters
lowercase: abdef (5) -> 5 / 10 * 100 = 50.0
uppercase: C (1)
neither: total - lower - upper (4)


DATA STRUCTURES
---------------
- Result hash: {lowercase: , uppercase: , neither: } with initialy counts set to 0

ALGORITHM
---------------
- Count the total number of characters in the string
- Iterate over the input string characters
  - Check if a character is either upper or lower case and increase counter accordingly
    - Use a regular expression
- Define a result hash with all values intially set to 0
- After counting occurrences, compute percentages and add to result hash
- Return result

---------------
NOTES:
- 

=end

def letter_percentages(string)
  total = string.length.to_f
  counts = {}
  
  counts[:lowercase] = string.chars.count { |c| c =~ /[a-z]/ }
  counts[:uppercase] = string.chars.count { |c| c =~ /[A-Z]/ }
  counts[:neither] = string.chars.count { |c| c =~ /[^A-Za-z]/ }

  p counts

  percentages = {lowercase: calculate_percentage(total, counts[:lowercase]), 
                 uppercase: calculate_percentage(total, counts[:uppercase]), 
                 neither: calculate_percentage(total, counts[:neither])}
end

def calculate_percentage(total, value)
  result = value / total * 100
  result.round(1)
end


# Examples:
p letter_percentages('abCdef 123') #== { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') #== { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') #== { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
p letter_percentages('abcdefGHI')