# Write a method that calculates and returns the index of the first Fibonacci number
# that has the number of digits specified as an argument. (The first Fibonacci number
# has index 1.)

# You may assume that the argument is always greater than or equal to 2.

# PEDAC:
# input - digits - 2 digits, 3 digits etc
# output - index number it will take for algorithm to get to a number of that digit

# data:
# - fibonaci adds the preceeding two elements to arrive at the next index

# could not figure this out... had to look at LS answer:

def find_fibonacci_index_by_length(num)
  first = 1
  second = 1
  index = 2

  loop do
    index += 1
    fibonaci = first + second
    break if fibonaci.to_s.size >= num

    first = second
    second = fibonaci
  end

  index
end




p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847

