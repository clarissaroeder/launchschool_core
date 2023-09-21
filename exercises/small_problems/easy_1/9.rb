# Get the middle character

def center_of(string)
  size = string.size.to_i
  if size.even?
    center = string[size / 2 - 1] + string[size / 2]
  else
    center = string[size / 2]
  end

  center
end

puts center_of('I love ruby')
puts center_of('Launch School')
puts center_of('Launch')
puts center_of('Launchschool')
puts center_of('x')
