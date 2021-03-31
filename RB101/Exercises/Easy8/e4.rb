# Write a method that returns a list of all substrings of a string. The returned list
# should be ordered by where in the string the substring begins. This means that all
# substrings that start at position 0 should come first, then all substrings that start
# at position 1, and so on. Since multiple substrings will occur at each position, the
# substrings at a given position should be returned in order from shortest to longest.

# You may (and should) use the leading_substrings method you wrote in the previous
# exercise:

require 'pry'
def leading_substrings(str)
  new_arr = []
  aggregate = ""
  str.chars.each do |letter|
    aggregate += letter
    new_arr.push(aggregate)
  end
  p new_arr
  # this method prints all the characters in str from index 0 to str.size
end

def substrings(str)
  counter = str.size
  index = 0
  loop do
    new_str = str[index..counter]
    leading_substrings(new_str)
    index += 1
    # binding.pry
    break if index == counter
  end

  # leading_substrings(str)
  # this method takes out the leading character in str and then runs through
  # leading_substrings method
end


# new_str = str.chars.shift(1)

substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

