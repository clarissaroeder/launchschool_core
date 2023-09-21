# Write a method that will take a short line of text, and print it within a box.

# def print_in_box(string)
#   size = string.size

#   if size <= 76
#     puts "+-" + ("-" * size) + "-+"
#     puts "| " + (" " * size) + " |"
#     puts "| " + string + " |"
#     puts "| " + (" " * size) + " |"
#     puts "+-" + ("-" * size) + "-+"
#   else
#     puts "+-" + ("-" * 76) + "-+"
#     puts "| " + (" " * 76) + " |"
#     puts "| " + string[(0..75)] + " |"
#     puts "| " + (" " * 76) + " |"
#     puts "+-" + ("-" * 76) + "-+"
#   end
# end

# Wrapping
def print_in_box(string)
  size = string.size
  max_length = 76
  extra_lines = size / max_length

  if extra_lines == 0
    puts "+-" + ("-" * size) + "-+"
    puts "| " + (" " * size) + " |"
    puts "| " + string + " |"
    puts "| " + (" " * size) + " |"
    puts "+-" + ("-" * size) + "-+"
  else
    puts "+-" + ("-" * max_length) + "-+"
    puts "| " + (" " * max_length) + " |"
    puts "| " + string[(0..75)] + " |"
    while extra_lines > 0
      string = string.delete_prefix(string[(0..75)])
      print "| " + string[(0..75)]
      if string.size < 76
        print (" " * (76 - string.size)) + " |\n"
      else 
        print " |\n"
      end
      extra_lines -= 1
    end

    puts "| " + (" " * max_length) + " |"
    puts "+-" + ("-" * max_length) + "-+"
  end
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('I am writing 80 characters to see if my method works correctly or otherwise I am screwed')
