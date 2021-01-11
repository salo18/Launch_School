# Write a program that will ask a user for an input of a word or multiple words and
# give back the number of characters. Spaces should not be counted as a character.

# Please write word or multiple words: walk
# There are 4 characters in "walk".

# Please write word or multiple words: walk, don't run
# There are 13 characters in "walk, don't run".

puts "Please write a word or mutliple words:"
word = gets.chomp

characters = word.delete(' ').length

puts "There are #{characters} characters in '#{word}'."