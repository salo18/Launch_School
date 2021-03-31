# Write a method that takes an Array of numbers and then returns the sum of the sums
# of each leading subsequence for that Array. You may assume that the Array always
# contains at least one number.

require 'pry'

def sum_of_sums(arr)
  total_sum = 0
  sum = 0

  # arr[0] + (arr[0]+arr[1]) + (arr[0]+arr[1]+arr[2])

  arr.each do |num|
    sum += num
    total_sum += sum
    binding.pry
  end
  p total_sum
end


sum_of_sums([3, 5, 2]) #== (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
# sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
# sum_of_sums([4]) == 4
# sum_of_sums([1, 2, 3, 4, 5]) == 35

