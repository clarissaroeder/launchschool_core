# What do each of these puts statements output?

a = %w(a b c d e)
puts a.fetch(7)
# Prediction: => IndexError
# Output:     => IndexError

puts a.fetch(7, 'beats me')
# Prediction: => "beats me"
# Output:     => "beats me"

puts a.fetch(7) { |index| index**2 }
# Prediction: => No output, or 49
# Output:     => 49
