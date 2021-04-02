# Write a method that takes a string argument, and returns true if all of the alphabetic
# characters inside the string are uppercase, false otherwise. Characters that are not
# alphabetic should be ignored.

def uppercase?(str)
  str == str.upcase
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

# Food for thought: in our examples, we show that uppercase? should return true if the
# argument is an empty string. Would it make sense to return false instead? Why or why not?

# it would make more sense to show an error message. something like "please enter a
# valid string"