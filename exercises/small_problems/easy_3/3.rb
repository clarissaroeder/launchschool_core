# Write a program that will ask a user for an input of a word or multiple words and give back the number of characters. Spaces should not be counted as a character.

print "Please write a word or sentence: "
words = gets.chomp

no_spaces = words.delete(" ")

puts "There are #{no_spaces.length} characters in \"#{words}\"."
