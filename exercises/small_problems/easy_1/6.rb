def triangle(num)
  stars = num
  spaces = 0

  num.times do |n|
    puts (" " * spaces) + ("*" * stars)
    spaces += 1
    stars -= 1
  end
end

triangle(6)
triangle(9)
