def my_method(array)
  if array.empty?
    []
  elsif array.size > 1
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([])         # => []
p my_method([3])        # => [21] -> 3 * 7
p my_method([3, 4])     # => [9, 16] -> (3 * 3), (4 * 4)
p my_method([5, 6, 7])  # => [25, 36, 49] -> (5 * 5), (6 * 6), (7 * 7)

# The elsif branch is missing the conditional statement. Therefore, code inside the branch is the conditional expression as far as the
# interpreter is concerned. Since map will return an Array, and arrays are always truthy, the elsif branch will always be executed.
# Of course, since the map invocation with the block were treated as the conditional expression, there is no code left to be executed inside the branch.
# An empty branch is equivalent to nil. 