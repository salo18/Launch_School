# Write a method that takes one argument, a positive integer, and returns a list of
# the digits in the number.

# puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
# puts digit_list(7) == [7]                     # => true
# puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
# puts digit_list(444) == [4, 4, 4]             # => true

# pseudocode:
# take integer
# add them to an array
# split them in the array but keep them as integers

def digit_list(num)
  num.to_s
end








def digit_list(num)
  if num.to_i > 0
    num.to_s.chars # not sure how to convert an array of strings into an array of #s
    # could have added on .map {|x| x.to_i}
  else
    puts "That's not a positive integer, try again."
  end
end

# LS answer:
def digit_list(number)
  number.to_s.chars.map(&:to_i)
end

# not sure about this &:to_i syntax but will look into it
