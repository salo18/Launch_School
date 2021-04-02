# Write a method that takes a number as an argument. If the argument is a positive number,
# return the negative of that number. If the number is 0 or negative, return the original
# number.

# Examples:

# my solution
# def negative(num)
#   if num.to_s.start_with?("-") || num == 0
#     num
#   else
#     negative = num.to_s
#     "-#{negative}".to_i
#   end
# end

# LS answer:
def negative(num)
  num > 0 ? -num : num
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby