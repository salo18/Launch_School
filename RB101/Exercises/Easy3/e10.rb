# Write a method that returns true if its integer argument is palindromic, false otherwise.
#  A palindromic number reads the same forwards and backwards.

def palindromic_number?(num)
  num.to_s.to_i == num.to_s.reverse.to_i
end

puts palindromic_number?(34543) == true
puts palindromic_number?(123210) == false
puts palindromic_number?(22) == true
puts palindromic_number?(5) == true

# Suppose your number begins with one or more 0s. Will your method still work?
# Why or why not? Is there any way to address this?

# no the method won't work because a 0 is ignored when it starts the number. Not sure
# how to address this. 