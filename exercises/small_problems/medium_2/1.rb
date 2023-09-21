=begin

PROBLEM
---------------
Restate: Write a programme that scans a text comprised of several sentences, finds the longest sentence based on number of words, 
and prints that sentence and the number of words in that sentence.

Input: String
Output: String (and Integer? What format for the number?)
Rules:
- Sentence ending characters are: . ? !
- Words are any sequence of characters separated by spaces, or sentence ending characters
- Sequences of special characters that are not sentence ending characters are treated as words (e.g.: --)

DATA STRUCTURES
---------------
- Array of sentences:
  [[sentence 1], [sentence 2], ..] 

ALGORITHM
---------------
- Scan the input text and identify sentences
  - Split the text into sentences:
    - Use #split with regex: /\.|\?|!/  -> will split a text into an array based on these characters
- Count words in sentences and identify longest one
  - Iterate over the sentence array and count words in each sentence:
    - Use #split + #size/length to count the number of words
  - Store the index of the current largest sentence in a variable
  - Compare the length of the current sentence with that sentences' length: if larger, update index 
- Print that sentence
  - Use the index variable to index into the array of sentences and print the sentence
- Print the count of words in that sentence

---------------
NOTES:
- Split a string into an array of sentences with a regular expression: .split(/\.|\?\!/)

Further exploration: 
- How to keep the sentence ending character?

=end


text = File.read('example.txt')
sentences = text.split(/(?<=[.?!])\s*/)
longest_sentence = sentences.max_by {|sentence| sentence.split.length }

puts longest_sentence
puts "Containing #{longest_sentence.split.length} words."
