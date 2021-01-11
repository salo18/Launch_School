# Write a method that returns true if the string passed as an argument is a palindrome,
# false otherwise. A palindrome reads the same forward and backward. For this exercise,
#  case matters as does punctuation and spaces.

def palindrome?(string)
  string == string.reverse
end
# this works!

# puts palindrome?('madam') == true
# puts palindrome?('Madam') == false          # (case matters)
# puts palindrome?("madam i'm adam") == false # (all characters matter)
# puts palindrome?('356653') == true


# Write a method that determines whether an array is palindrome
def palindrome_array?(array)
  array == array.reverse
end
# this works!

# puts palindrome_array?([1,2,3,2,1]) == true
# puts palindrome_array?([1,2,3]) == false

# Now write a method that determines whether an array or a string is palindromic
# You may not use an if, unless, or case statement or modifier.

def palindrome_s_a?(array)
  array == array.reverse
end

puts palindrome_s_a?([1,2,3,2,1]) == true
puts palindrome_s_a?([1,2,3]) == false
puts palindrome_s_a?('madam') == true
puts palindrome_s_a?('Madam') == false 