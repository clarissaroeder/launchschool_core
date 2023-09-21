=begin
Write a method that takes a string as an argument and returns a new string in which every uppercase letter is replaced by its lowercase version, and every lowercase letter by its uppercase version. All other characters should be unchanged.

You may not use String#swapcase; write your own version of this method.
=end

def swapcase(string)
  string.chars.map do |char|
    if char == char.upcase
      char.downcase
    elsif char == char.downcase
      char.upcase
    else
      char
    end
  end.join
end


# Examples:
p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'