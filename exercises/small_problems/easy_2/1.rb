# Build a program that randomly generates and prints Teddy's age. To get the age, you should generate a random number between 20 and 200.

def print_age
  puts "Enter a name or press Enter:"
  name = gets.chomp
  name = name.empty? ? "Teddy" : name
  age = rand((20..200))
  puts "#{name} is #{age} years old."
end

print_age




