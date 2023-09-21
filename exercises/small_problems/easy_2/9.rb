name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

# What does this print out? Can you explain these results?
# This will print out:
# BOB
# BOB

# This is because both name and save_name point at the string object 'Bob', and the #upcase! method is a mutating method.
# When calling that method, the object Bob is changed to BOB, which both variables still point at.