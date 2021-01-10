# Write a method that takes one argument, a string, and returns a new string with the
# words in reverse order.

# puts reverse_sentence('') == ''
# puts reverse_sentence('Hello World') == 'World Hello'
# puts reverse_sentence('Reverse these words') == 'words these Reverse'

# pseudo code
# get string
# convert string into an array
# reverse the order of the array
# convert back into a string


def reverse_sentence(string)
  string.split.reverse.join(" ")
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
