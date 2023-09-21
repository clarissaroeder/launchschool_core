# Create a hash that expresses the frequency with which each letter occurs in this string:
statement = "The Flintstones Rock"

# frequencies = {}
# statement.each_char do |char|
#   if !frequencies.include?(char)
#     counter = statement.count(char)
#     frequencies[char] = counter
#   end
# end

# p frequencies

letters = ('A'..'Z').to_a + ('a'..'z').to_a
result = {}

letters.each do |letter|
  frequency = statement.count(letter)
  result[letter] = frequency if frequency > 0
end

p result
