# Build a program that asks a user for the length and width of a room in meters and then displays the area of the room in both square meters and square feet.

def calculate_size(length, width)
  square_meters = length.to_f * width.to_f
  square_feet = (square_meters * 10.7639).round(2)

  puts "The area of the room is #{square_meters} square meters (#{square_feet} square feet)."
end

puts "Enter the length of the room in meters:"
length = gets.chomp

puts "Enter the width of the room in meters:"
width = gets.chomp

calculate_size(length, width)