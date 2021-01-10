# Write a method that takes one integer argument, which may be positive, negative, or zero.
# This method returns true if the number's absolute value is odd. You may assume that the
# argument is a valid integer value.

# Examples:
# puts is_odd?(2)    # => false
# puts is_odd?(5)    # => true
# puts is_odd?(-17)  # => true
# puts is_odd?(-8)   # => false
# puts is_odd?(0)    # => false
# puts is_odd?(7)    # => true

# pseudo code:
# take a number
# if absolute value is odd, true

# 1st attempt
# def odd(num)
#   if num % 2 != 0
#     puts true
#   else
#     puts false
#   end
# end

# 2nd attempt:
def is_odd?(num)
  num.abs % 2 !=0
end


# If you weren't certain whether % were the modulo or remainder operator,
# how would you rewrite #is_odd? so it worked regardless?

# using .remainder

def remainder(num)
  num.remainder(2) != 0
end










