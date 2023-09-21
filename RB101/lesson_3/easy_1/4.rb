# What do the following method calls do (assume we reset numbers to the original array between method calls)?

numbers = [1, 2, 3, 4, 5]
p numbers.delete_at(1)
# Deletes '2' at index 1, mutates

numbers = [1, 2, 3, 4, 5]
p numbers.delete(1)
# Deletes '1' at index 0, mutates
