=begin
PROBLEM:
A method that takes a string and returns a new string, with every other letter capitalisesd, and the remaining characters in lowercase.
Characters that are not letters should not be changed but counted.

ALGORITHM:
- Convert string into all lowercase
- Convert string into array of characters
- Define index counter variable
- Iterate over array:
  - Change every character at an even index to uppercase if its a letter
  - increment idx by 1
- Join array to string and return

=end

def staggered_case(string)
  chars = string.downcase.chars
  i = 0

  while i < chars.size
    chars[i] = chars[i].upcase if i.even?
    i += 1
  end
  
  chars.join
end


# Examples: 
p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'