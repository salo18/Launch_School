# Given the array of several numbers below, use an until loop to print each number.

numbers = [7, 9, 13, 25, 18]

# until numbers.size == 0
#   p numbers.shift
# end

# p numbers

count = 0

until count == 5
  p numbers[count]
  count += 1
end