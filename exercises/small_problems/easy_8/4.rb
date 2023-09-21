=begin
Write a method that returns a list of all substrings of a string that are palindromic. 
That is, each substring must consist of the same sequence of characters forwards as it does backwards. 
The return value should be arranged in the same sequence as the substrings appear in the string. 
Duplicate palindromes should be included multiple times.

You may (and should) use the substrings method you wrote in the previous exercise.

For the purposes of this exercise, you should consider all characters and pay attention to case; 
that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. 
In addition, assume that single characters are not palindromes.


RULES:
- return all palindromic substrings in the order they appear in the string
- duplicate palindromes should appear multiple times
- consider all characters and case
- single character is not palindromic
- a string with no palindromes should return an empty array

FURTHER EXPLORATION:
- ignore non-alphanumerical characters and case
  - CASE:
  - change palindrome? to check the string in all lowercase
  - ALPHANUM:
  - change palindrome? to check the string after the non-alnum characters have been removed
  - 

ALGORITHM:
- get all possible substrings of the string -> substrings method
- define an empty result array
- select all substrings from the substrings array that are equal to their reverse
  - check for length: if length is 1 then exclude
- return result array
=end

def substrings(string)
  result = []
  
  0.upto(string.size - 1) do |start|
    1.upto(string.size - start) { |count| result << string[start, count] }
  end

  result
end

def palindrome?(string)
  string = string.downcase.delete("^a-z0-9")
  string == string.reverse && string.size > 1
end

def palindromes(string)
  substrings = substrings(string)
  substrings.select do |substring|
    palindrome?(substring)
  end
end

# Examples:
p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
# p palindromes('hello-madam-did-madam-goodbye') == [
#   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#   '-madam-', 'madam', 'ada', 'oo'
# ]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

