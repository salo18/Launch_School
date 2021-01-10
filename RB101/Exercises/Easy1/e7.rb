# Write a method that takes one argument, a positive integer, and returns a string of
# alternating 1s and 0s, always starting with 1. The length of the string should match
# the given integer.

# pseudocode
# get a number and find out the length
# if the number is 1, print out 1
# if the number is 2, print out 10
# if the number is odd?
# if the number is even?
# need to somehow use the number's index value to print 1 or 0 individually

# my solution
# def stringy(num)
#   if num 1
#     p 1
#   elsif num 2
#     p 10
#   elsif num % 2 != 0
#     num.times {|x| puts x}
# end

# LS answer

def stringy(size)
  numbers = []

  size.times do |index|
    number = index.even? ? 1 : 0
    numbers << number
  end

  numbers.join
end



puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'