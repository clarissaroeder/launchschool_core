# One day Spot was playing with the Munster family's home computer and he wrote a small program to mess with their demographic data:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

# After writing this method, he typed the following...and before Grandpa could stop him, he hit the Enter key with his tail:
mess_with_demographics(munsters)

# Did the family's data get ransacked? Why or why not?
# Prediction: No, the data did not get messed up because each of the operations performed in the method are non-mutable. The object returned is a copy of the original hash.
p munsters

# Solution: Yes, the data got messed up because the [] is actually a method call. The #[] method mutates the object.
# To be clear, the munsters hash did not get altered (same object id as before), but the objects within the hash did: for each family member hash,
# the objects are now different (each key:value object now has a different object id.)