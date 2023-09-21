greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

# What's the result of the last line?
# => {:a=>'hi there'}
# That's because the #<< method (concatenation) is mutating the object