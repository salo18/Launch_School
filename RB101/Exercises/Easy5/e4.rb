# Given a string of words separated by spaces, write a method that takes this
# string of words and returns a string in which the first and last letters of
# every word are swapped.

# You may assume that every word contains at least one letter, and that the string
# will always contain at least one word. You may also assume that each string contains
# nothing but words and spaces

def swap(str)
  new_str = str.split(' ').map do |word|
    # word[0] = word[-1]
    # word[-1] = word[0]
    word[0], word[-1] = word[-1], word[0]
    # did not know how to do this... learned this technique from the LS solution
    word
  end
  new_str.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'


# How come our solution passes word into the swap_first_last_characters method
# invocation instead of just passing the characters that needed to be swapped?
# Suppose we had this implementation:

# def swap_first_last_characters(a, b)
#   a, b = b, a
# end

# and called the method like this:
# swap_first_last_characters(word[0], word[-1])

# Would this method work? Why or why not?
# This method would not work on multiword strings. This solution would swap the first
# and last letter of the entire string but not do it on each word as required

# after reading the answer...
# I made a mistake and did not realize the challenge was referring to just the helper
# method... my reasoning was correct but the helper method's return value is the
# new reassigned letters but not the word itself 



