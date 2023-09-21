=begin
Write a program that prints out groups of words that are anagrams. 
Anagrams are words that have the same exact letters in them but in a different order. 

PROBLEM
---------------
RESTATE: A programme that outputs arrays of anagrams based on an array of words.
INPUT: Array of words
OUTPUT: Arrays of words that are anagrams of each other
RULES: no duplicate collections  

DATA STRUCTURES
---------------
INPUT: Array of words
INBETWEEN: A hash to store anagrams? a letter combination as key
OUTPUT: Arrays of anagrams
NOTES: 

ALGORITHM
---------------
- Define a anagram hash
- Iterate over words array:
  - Split current word into array of characters, sort, and join back together
  - If the hashes keys don't include that letter combination yet: 
    - add this key with the current word as the first element in an array as value
  - If it does: add the word to the array of that key

- Iterate over hash:
  - Print all values

=end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

anagrams = {}

words.each do |word|
  letters = word.chars.sort.join
  if anagrams.keys.include?(letters)
    anagrams[letters] << word
  else
    anagrams[letters] = [word]
  end
end

anagrams.each { |_, v| p v }


# Example output:
          # ["demo", "dome", "mode"]
          # ["neon", "none"]
