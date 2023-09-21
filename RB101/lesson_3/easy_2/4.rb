# See if the name "Dino" appears in the string below:
advice = "Few things in life are as important as house training your pet dinosaur."

p advice.include?("Dino") # Searches for sub-string
p advice.match?("Dino") # Pattern matching with regex