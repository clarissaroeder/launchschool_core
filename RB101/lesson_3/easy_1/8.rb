# Given the hash below
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

# Create an array containing only two elements: Barney's name and Barney's number.
array = []
flintstones.each do |key, value| 
  if key == "Barney"
    array.push(key)
    array.push(value)
  end
end

# Or:
array = flintstones.assoc("Barney")