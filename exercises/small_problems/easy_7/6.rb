# This time don't count non-letters

LETTERS = ('a'..'z').to_a

def staggered_case(string)
  chars = string.downcase.chars
  i = 0
  even = 0

  while i < chars.size
    if LETTERS.include? chars[i]
      chars[i] = chars[i].upcase if even.even?
      i += 1
      even += 1
    else
      i += 1
      next
    end
  end
  chars.join
end

# Examples:
p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'