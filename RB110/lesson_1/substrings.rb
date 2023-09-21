def palindrome_substrings(string)
  result = []
  substrings_arr = substrings(string)

  substrings_arr.each do |sub|
    result << sub if is_palindrome?(sub)
  end
  result
end

def substrings(string)
  result = []
  length = string.length
  i = 0

  while i <= length - 2
    j = 2
    while j <= (length - i)
      result << string[i, j] 
      j += 1
    end
    i += 1
  end
  result
end

def is_palindrome?(string)
  string == string.reverse
end


# arr = substrings("")
# arr.each do |sub|
#   p "yes" if is_palindrome?(sub)
# end

p palindrome_substrings("supercalifragilisticexpialidocious")