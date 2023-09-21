require 'date'

puts Date.civil
# Predicted output: => 0001, 01, 01
# Actual output:    => -4712-01-01

puts Date.civil(2016)
# Predicted output: => 2016, 01, 01
# Actual output:    => 2016-01-01

puts Date.civil(2016, 5)
# Predicted output: => 2016, 05, 01
# Actual output:    => 2016-05-01

puts Date.civil(2016, 5, 13)
# Predicted output: => 2016, 05, 13
# Actual output:    => 2016-05-13