# Write your own version of the rails titleize implementation.

def my_titleize(string)
  title = string.split.map { |word| word.capitalize}.join(" ")
end

words = "the flintstones rock"
p my_titleize(words)