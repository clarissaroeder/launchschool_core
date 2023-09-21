=begin
---------------
PROBLEM
---------------
Write a madlibs programme that reads a text from an external file.

Input:
Output:
Rules:

DATA STRUCTURES
---------------
Nested in a hash: arrays of adjectives, nouns, etc. and sample each time?

---------------
NOTES:
- File.read('text.txt')
- gsub with block and regular expression:
  - gsub(match_pattern) { |match| replacement }
  - / / -> denotes beginning and end of regex
  - %{ } -> the regex matches these literal characters, which are used to define 
    beginning and end of the placeholders in the text
  - (\w+):
    - ( ) -> parentheses are used to group and capture a portion of the regex pattern
    - \w -> a shorthand character class that matches any word character (letters, digits, underscores)
    - + -> means one or more occurrence
    => together it creates a capture group that captures one or more consecutive word characters,
       thereby extracting the name of the placeholder from the text
  - $1 -> a special variable that represents the first captured group within a pattern
    - When a regex includes (), the contents matched by those parentheses are captured and assigned to
      special numbered variables starting at $1
    - When iterating over the text, the regex pattern captures the placeholder name and stores it in $1:
      - For example, the first placeholder is %{adjective}. $1 = adjective
      - Now we can convert it to a symbol to access the array of adjectives in the hash
=end

TEXT = File.read('madlibs.txt')

words = {
  adjective: %w(quick lazy sleepy ugly),
  noun: %w(fox dog head leg),
  verb: %w(jumps lifts bites licks),
  adverb: %w(easily lazily noisly excitedly)
}

madlibs =  TEXT.gsub(/%{(\w+)}/) { |_| words[$1.to_sym].sample }

puts madlibs
