# What will the following code print and why?
array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each do |value| 
  value = value.dup
  array2 << value
end
 
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2



