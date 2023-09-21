# Problem: write a method that sorts an array of integers (0-19) based on the English words for the numbers
# Input: array of integers        # Output: array of integers -> same array??
# Sorted by english words means alphabetically sorted

WORDS = %w(zero one two three four five six seven eight nine ten eleven 
twelve thirteen fourteen fifteen sixteen seventeen eighteen ninenteen)

def alphabetic_number_sort(numbers)
  result = []
  numbers.each { |num| result << WORDS[num]}
  result.sort.map! { |word| word = WORDS.index(word)}
end

# Examples:
p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

# Data Structures: input array, output array
  # Some constant for the English words? Hash?

# Algorithm: 
# 1. Initialise empty result array
# 2. Populate array with English words based on the input array's numbers:
    # Iterate over input array and add the word at index[element] of the words constant to result
# 3. Sort array
# 4. Swap words for numbers
# 3. Return array