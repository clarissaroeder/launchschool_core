# Remove people with age 100 or more
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.each do |name, age|
  if age > 100
    ages.delete(name)
  end
end

p ages