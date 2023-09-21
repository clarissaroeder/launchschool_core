=begin
B:O   X:K   D:Q   C:P   N:A   G:T   R:E   F:S   J:W   H:U   V:I   L:Y   Z:M

---------------
PROBLEM
---------------
Restate: Given spelling blocks consisting of two letters, write a method that checks whether a word can be spelled based on this set of blocks.

Input: string
Output: boolean
Rules:
  - A word can only contain one of the letters of each pair
  - Each letter in any of the blocks can only be used once

EXAMPLE
---------------
BABY -> false, because B is used twice
BUTCH -> false, because H:U

DATA STRUCTURES
---------------
- Hash for spelling blocks? 

ALGORITHM
---------------
- Define a hash constant containing the spelling blocks
- Check every letter of the word: is it included in one of the spelling blocks?
  - Iterate over the word and check whether the current letter is included in a list of keys and values - If yes:
    - Does it only occur once in the word?
  - Check for the other letter of the pair
    - Is the second letter of the block NOT present in the word?
  -> If all conditions are satisfied, return true

---------------
NOTES:
- Case insenstive -> turn input string into all uppercase!

=end

require 'pry'

BLOCKS = {'B' => 'O', 'X' => 'K', 'D' => 'Q', 'C' => 'P', 'N' => 'A', 'G' => 'T', 
'R' => 'E', 'F' => 'S', 'J' => 'W', 'H' => 'U', 'V' => 'I', 'L' => 'Y', 'Z' => 'M'}

def block_word?(word)
  word.upcase.each_char do |c|
    if BLOCKS.keys.include?(c)
      return false if word.count(c) > 1 || word.include?(BLOCKS[c])
    elsif BLOCKS.values.include?(c)
      return false if word.count(c) > 1 || word.include?(BLOCKS.key(c))
    end
  end
  return true
end


# Examples:
p block_word?('BATCH') #== true
p block_word?('BUTCH') #== false
p block_word?('jest') #== true