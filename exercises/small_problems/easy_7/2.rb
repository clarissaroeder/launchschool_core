=begin 
PROBLEM
---------------
RESTATE: A method that takes a string as argument, and returns a hash with 3 key-value pairs, with number of elements that are lowercase, uppercase, and everything else as values.
INPUT: String
OUTPUT: A hash, 3 keys: lowercase, uppdercase, neither
RULES: An empty string returns the hash with 0 for all values

EXAMPLES
---------------

DATA STRUCTURES
---------------
INPUT:
INBETWEEN:
OUTPUT:
NOTES: count? 

ALGORITHM
---------------
REMINDERS:
HIGHER LEVEL:
- Define result hash and set values to 0
- Iterate over each element:
  - Increment lowercase if element is lowercase by 1
  - increment  uppercase if element is uppercase by 1
  - increment neither by 1 if element is neither
- return result

=end

def letter_case_count(string)
  result = {lowercase: 0, uppercase: 0, neither: 0}
  string.each_char do |char|
    if ('a'..'z').include? char
      result[:lowercase] += 1
    elsif ('A'..'Z').include? char
      result[:uppercase] += 1
    else
      result[:neither] +=1
    end
  end
  result
end

# Examples
p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }