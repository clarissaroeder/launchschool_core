=begin
Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 
'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

PROBLEM
---------------
Restate: Given a string, write a method that converts any words representing numbers in that string to digits and returns the same string.
Input: String
Output: String
Rules:
- The same string must be returned

EXAMPLE/TEST CASE BREAKDOWN:
---------------


DATA STRUCTURES
---------------
- Input: string
- Inbetween: array of strings
- Output: string

ALGORITHM
---------------
Reminders: the same string must be returned

- Define variables that contain strings representing numbers from zero to nine
- Find words in string that represent numbers: use the variables in a regex to scan the string for occurences
- Replace words with string representations of the respective number
- Return original string

- Notes:
/\b#{foo}\b/
foo =  a variable containing some word

=end

WORDS = %w[zero one two three four five six seven eight nine]
NUMBERS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def word_to_digit(string)
  WORDS.each_with_index do |word, idx|
  string.gsub!(/\b#{word}\b/, NUMBERS[idx])
  end
  string
end


# Examples:
p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

