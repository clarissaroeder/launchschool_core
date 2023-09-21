# Build a program that displays when the user will retire and how many years she has to work till retirement.

print "What is your age? "
age = gets.to_i

print "At what age would you like to retire? "
retirement_age = gets.to_i

years_until_retirement = retirement_age - age
year_now = Time.now.year
year_of_retirment = year_now + years_until_retirement

puts "It's #{year_now}. You will retire in #{year_of_retirment}."
puts "You only have #{years_until_retirement} years of work to go!"