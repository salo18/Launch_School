# Write a method that returns the next to last word in the String passed to it as an
# argument.
# Words are any sequence of non-blank characters.
# You may assume that the input String will always contain at least two words.

def penultimate(str)
  str1 = str.split
  str1[-2]
end


# Examples:
# p penultimate('last word') == 'last'
# p penultimate('Launch School is great!') == 'is'

# further exploration
# Suppose we need a method that retrieves the middle word of a phrase/sentence.
# What edge cases need to be considered? How would you handle those edge cases without
# ignoring them? Write a method that returns the middle word of a phrase or sentence.
# It should handle all of the edge cases you thought of.

# edge cases:
# - strings with one word
# - strings with even number of words? which is the middle word?

def middle(str)
  str1 = str.split
  index = str1.size / 2
  return '' if str1.size <= 2 || str1.size.even?

  str1[index]
end

p middle('Hey one two three words') == "two"
p middle('Hey one three words') == ""
p middle('') == ''
p middle('one') == ''