# Problem: Given a string of words separated by spaces, write a method that takes this string of words and returns a string in which the first and last letters of every word are swapped.
# Input: string     Output: string
# Assume each word contains at least one letter, and each string contains at least one word
# Assume only words and whitespaces are contained in the string

def swap(string)
  string.split.each { |word| word[0], word[-1] = word[-1], word[0]}.join(" ")
end


# Examples:
p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
 p swap('a') == 'a'

# Algorithm:
# 1. Turn string into array of words: #split
# 2. Loop over array:
  # 3. Define buffer variable to contain a char
  # 4. Manually swap characters of index 0 and index length - 1
# 6. Convert array into a string with #join(" ")
